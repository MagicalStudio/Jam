event_inherited();

#region nova state machine

if (!global.especial_ativo)
{
	switch(estado)
	{
		
		#region parado
		case "parado":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			sprite_index = asset_get_index("spr_inimigo_01_parado_"+string(skin))
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
			
			velh = 0;
			velv = 0;
		
			if (instance_inside_view_camera(view_camera[0]))
			{
				if (alarm[0]==-1) alarm[0] = room_speed/2+irandom_range(-20,20);
			}
	
		break;
		#endregion 
		
		#region andando
		case "andando":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			sprite_index = asset_get_index("spr_inimigo_01_andando_"+string(skin))
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
			
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
			
			if (distance_to_object(obj_player) > distancia_voltar)
			{
				direcao_andar = point_direction(x,y,obj_player.x,obj_player.y);
				velh = lengthdir_x(vel,direcao_andar);
				velv = lengthdir_y(vel,direcao_andar);		
			}else{
				estado = "atacando";
				timer_para_avancar = 20;
			}
	
		break;
		#endregion
	
		#region atacando
		case "atacando":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			if (!escolhido_para_atacar) sprite_index = asset_get_index("spr_inimigo_01_armando_"+string(skin))
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
	
			if (distance_to_object(obj_player) > distancia_voltar)
			{
				estado = "andando";
			}else{
				
				if (!escolhido_para_atacar)
				{
					with(obj_controle_dos_inimigos)
					{
						if (quantidade_inimigos_atacando<2)
						{
							event_user(0);
						}
					}
				}
				
				velv = 0;
				velh = 0;
				if (escolhido_para_atacar)
				{
					aumentar_x = false;
					timer_para_avancar--;
					if (timer_para_avancar <= 0)
					{
						if (distance_to_object(obj_player) > 10) && (!aumentar_x)
						{
							sprite_index = asset_get_index("spr_inimigo_01_andando_"+string(skin))
							direcao_andar = point_direction(x,y,obj_player.x,obj_player.y);
							velh = lengthdir_x(vel,direcao_andar);
							velv = lengthdir_y(vel,direcao_andar);			
						}else{
							if (y != clamp(y,obj_player.y-3,obj_player.y+3))
							{
								var y_add = sign(obj_player.y-y);
								y+=y_add;
							}else{
								if (ceil(x)!=ceil(obj_player.x+x_atacar))
								{
									sprite_index = asset_get_index("spr_inimigo_01_armando_"+string(skin))
									aumentar_x = true;
									var x_add_ = sign(obj_player.x+x_atacar-x);
									x+=x_add_;
								}else{
									sprite_index = asset_get_index("spr_inimigo_01_armando_"+string(skin))
									estado = "atacar";
									timer_para_avancar = 20;
								}
							}
						}
					}
				}
			}
	
		break;
		#endregion
		
		#region atacar
		case "atacar":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			sprite_index = asset_get_index("spr_inimigo_01_armando_"+string(skin))
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
	
			if (alarm[1]==-1)
			{
				alarm[1] = 15;
			}
	
		break;
		#endregion
		
		#region ataquei
		case "ataquei":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			sprite_index = asset_get_index("spr_inimigo_01_soco_"+string(skin))
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
			
		break;
		#endregion
		
		#region voltar
		case "voltar":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;	
			
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
				
			velh = lengthdir_x(vel,direcao_voltar);
			velv = lengthdir_y(vel,direcao_voltar);
			
			if (point_distance(x,y,x_y_voltar[0],x_y_voltar[1]) < 5)
			{
				estado = "andando";
			}
			
			sprite_index = asset_get_index("spr_inimigo_01_andando_"+string(skin))
		
		break;
		#endregion
		
		#region recebendo_dano
		case "recebendo_dano":
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			velv = 0;
			velh = 0;
			
			sprite_index = asset_get_index("spr_inimigo_01_apanhando_"+string(skin))
			
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
			
			if (alarm[2] == -1) 
			{
				alarm[2] = 20; 
			}
		break;
		#endregion
	
		#region knockback
		case "knockback":
			sprite_index = asset_get_index("spr_inimigo_01_apanhando_"+string(skin))
			z_pos+=z_pos_add;
			if (z_pos>-16) && (subir)
			{
				z_pos_add-=.25;
			}else{
				subir = false;
				z_pos_add+=.25;
				if (z_pos>=0)
				{
					subir = true;
					estado = "caido";
					z_pos = 0;
					z_pos_add = -2;
				}
			}
			image_angle+=2.2 * xscale;
			velh = xscale*2*-1;
			velv = 0;
			
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
		break;
		#endregion
		
		#region caido
		sprite_index = asset_get_index("spr_inimigo_01_apanhando_"+string(skin))
		case "caido":
			velv = 0;
			velh = 0;
			if (alarm[3]==-1) alarm[3] = room_speed;
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
		break;
		#endregion
	
		#region levantando
		sprite_index = asset_get_index("spr_inimigo_01_apanhando_"+string(skin))
		case "levantando":
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
			//velv=-1;
			image_angle = lerp(image_angle,0,.1);
			if (round(image_angle)==0) estado = "andando";
		break;
		#endregion
	}
}else{
	if (alarm[5] == -1) && (instance_exists(obj_prancheta))
	{
		sprite_index = asset_get_index("spr_inimigo_01_apanhando_"+string(skin))
		alarm[5] = 30;
	}
}

#endregion

#region state machine antiga que nao presta
/* state machine antiga

//state machine
sprite_index = asset_get_index("spr_inimigo_01_parado_"+string(skin))

if (!global.especial_ativo)
{
	switch(estado)
	{
		case "parado":
			velv = 0;
			velh = 0;
			if (instance_inside_view_camera(view_camera[0]))
			{
				if (alarm[0] == -1) alarm[0] = 20;
			}
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
		break;
	
		case "andando":
			image_angle = 0;
			var dir = point_direction(x,y,obj_player.x,obj_player.y);
			velh = lengthdir_x(vel,dir);
			velv = lengthdir_y(vel,dir);
		
			if (obj_player.x>x) xscale = 1;
			else xscale=-1;
			
			if (distance_to_point(obj_player.x,obj_player.y) <= 60)
			{
				estado = "atacando";
			}		
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
		
		break;
	
		case "atacando":		
			velv = 0;
			velh = 0;
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
			if (distance_to_point(obj_player.x,obj_player.y) >= 60)
			{
				estado = "andando";
			}else{
				 if (timer_para_avancar>0)
				 {
					 timer_para_avancar--
				 }else{
					 if (global.inimigo01_avancando == false)
					 {
						 timer_para_avancar = 40;
						 global.inimigo01_avancando = id;
						 x_y_voltar=[x,y];
						 estado = "atacar";
					 }
				 }
			}
		
			if (obj_player.x>x) xscale = 1;
			else xscale=-1;
		
		break;
	
		case "atacar":
			if (obj_player.x>x) xscale = 1;
			else xscale=-1;
		
			var dir = point_direction(x,y,obj_player.x,obj_player.y);
			velh = lengthdir_x(vel*1.5,dir);
			velv = lengthdir_y(vel*1.5,dir);
		
			if (global.inimigo01_avancando!=id) estado = "andando";
		
			if (distance_to_point(obj_player.x,obj_player.y) <= 20)
			{
				velv = 0;
				velh = 0;
				var distancia_y = abs(obj_player.y-y)
				if (distancia_y > 5)
				{
					y+=sign(obj_player.y-y);
				}else{
					if (alarm[1]==-1) alarm[1] = 30
				}
			}
			if (distance_to_point(obj_player.x,obj_player.y) >= 60)
			{
				estado = "andando";
				if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
			}
		
		break;
	
		case "voltar":
			var dir = point_direction(x,y,x_y_voltar[0],x_y_voltar[1]);
			velh = lengthdir_x(vel,dir);
			velv = lengthdir_y(vel,dir);
			
			if (obj_player.x>x) xscale = 1;
			else xscale=-1;
			
			if (distance_to_point(x_y_voltar[0],x_y_voltar[1])<.1)
			{
				estado = "andando";
			}
		break;

		case "recebendo_dano":
			velv = 0;
			velh = 0;
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
			if (alarm[2] == -1) 
			{
				alarm[2] = 20; 
			}
		break;
	
		case "knockback":
			z_pos+=z_pos_add;
			if (z_pos>-16) && (subir)
			{
				z_pos_add-=.25;
			}else{
				subir = false;
				z_pos_add+=.25;
				if (z_pos>=0)
				{
					subir = true;
					estado = "caido";
					z_pos = 0;
					z_pos_add = -2;
				}
			}
			image_angle+=2.2 * xscale;
			velh = xscale*2*-1;
			velv = 0;
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
		break;
	
		case "caido":
			velv = 0;
			velh = 0;
			if (alarm[3]==-1) alarm[3] = room_speed;
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
		break;
	
		case "levantando":
			if (global.inimigo01_avancando == id) global.inimigo01_avancando = false;
			//velv=-1;
			image_angle = lerp(image_angle,0,.1);
			if (round(image_angle)==0) estado = "andando";
		break;
	}
}else{
	if (alarm[5]==-1)
	{
		alarm[5] = room_speed;
	}
}

*/
#endregion