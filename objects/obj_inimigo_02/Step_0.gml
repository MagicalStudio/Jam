event_inherited();

#region nova state machine

if (!global.especial_ativo)
{
	switch(estado)
	{
		
		#region parado
		case "parado":
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
			
			velh = 0;
			velv = 0;
		
			if (instance_inside_view_camera(view_camera[0]))
			{
				if (alarm[0]==-1) alarm[0] = room_speed;
			}
	
		break;
		#endregion 
		
		#region andando
		case "andando":
		
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
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
				timer_para_avancar = 40;
			}
	
		break;
		#endregion
	
		#region atacando
		case "atacando":
		
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
	
			if (distance_to_object(obj_player) > distancia_voltar)
			{
				estado = "andando";
			}else{
				with(obj_controle_dos_inimigos)
				{
					if (inimigos02_array==false)
					{
						event_user(1);
					}
				}
				velv = 0;
				velh = 0;
				if (escolhido_para_atacar)
				{
					timer_para_avancar--;
					if (timer_para_avancar <= 0)
					{
						if (distance_to_object(obj_player) > 10)
						{
							direcao_andar = point_direction(x,y,obj_player.x,obj_player.y);
							velh = lengthdir_x(vel,direcao_andar);
							velv = lengthdir_y(vel,direcao_andar);			
						}else{
							if (y != clamp(y,obj_player.y-3,obj_player.y+3))
							{
								var y_add = sign(obj_player.y-y);
								y+=y_add;
							}else{
								estado = "atacar";
								timer_para_avancar = 40;
							}
						}
					}
				}
			}
	
		break;
		#endregion
		
		#region atacar
		case "atacar":

			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
	
			if (alarm[1]==-1)
			{
				alarm[1] = 30;
			}
	
		break;
		#endregion
		
		#region ataquei
		case "ataquei":

			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
			
		break;
		#endregion
		
		#region voltar
		case "voltar":
			
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;	
			
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
				
			velh = lengthdir_x(vel,direcao_voltar);
			velv = lengthdir_y(vel,direcao_voltar);
			
			if (point_distance(x,y,x_y_voltar[0],x_y_voltar[1]) < 5)
			{
				estado = "andando";
			}
			
		
		break;
		#endregion
		
		#region recebendo_dano
		case "recebendo_dano":
			velv = 0;
			velh = 0;
				
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
			
			if (alarm[2] == -1) 
			{
				alarm[2] = 20; 
			}
		break;
		#endregion
	
		#region knockback
		case "knockback":
			z_pos+=z_pos_add;
			if (z_pos>-8) && (subir)
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
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
		break;
		#endregion
		
		#region caido

		case "caido":
			velv = 0;
			velh = 0;
			if (alarm[3]==-1) alarm[3] = room_speed;
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
		break;
		#endregion
	
		#region levantando

		case "levantando":
			if (escolhido_para_atacar)
			{
				escolhido_para_atacar = false;
				obj_controle_dos_inimigos.inimigos02_array = false;
			}
			//velv=-1;
			image_angle = lerp(image_angle,0,.1);
			if (round(image_angle)==0) estado = "andando";
		break;
		#endregion
	}
}else{
	if (alarm[5] == -1)
	{
		alarm[5] = 30;
	}
}

#endregion


#region state machine ruim eca
/*
//state machine
sprite_index = asset_get_index("spr_inimigo_02_parado_"+string(skin))

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
			if (z_pos>-10) && (subir)
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
			velh = xscale*1.5*-1;
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