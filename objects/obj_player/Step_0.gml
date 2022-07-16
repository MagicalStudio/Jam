//input
var left,down,up,right,soco,especial
left = keyboard_check(vk_left) or (keyboard_check(ord("A")));
down = keyboard_check(vk_down) or (keyboard_check(ord("S")));
right = keyboard_check(vk_right) or (keyboard_check(ord("D")));
up = keyboard_check(vk_up) or (keyboard_check(ord("W")));
soco = keyboard_check(ord("C"));
especial = keyboard_check(vk_space);
	
//state machine
if (!instance_exists(obj_morte))
{
	switch(estado)
	{
		#region parado
		case "parado":
			velv = (down - up) * vel;
			velh = (right - left) * vel;
			tempo_combo = tempo_padrao;
			combo_fase = 0;
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			if (velv!=0 or velh!=0) estado = "andando";
			if (soco) estado = "socando";
			if (especial) ativar_especial();
			sprite_index = spr_player_parado;
		break;
		#endregion
	
		#region andando
		case "andando":
			image_angle = lerp(image_angle,0,.1);
			if (velv!=0 or velh!=0)
			{
				combo_fase = 0;
				tempo_combo = tempo_padrao;
				z_pos = lerp(z_pos,0,.1);
				velv = (down - up) * vel;
				velh = (right - left) * vel;
				//movimento 	
				if (soco) estado = "socando";
				sprite_index = spr_player_andando;
				if (especial) ativar_especial();
			}else{
				estado = "parado";
			}
		break;
		#endregion
	
		#region socando
		case "socando":
			image_angle = lerp(image_angle,0,.1);
			z_pos = lerp(z_pos,0,.1);
			if (alarm[0]==-1) tempo_combo--;
			if (tempo_combo <=0) estado = "parado";
			var tempo_ataque = 20;
				
			velh = 0;	
			velv = 0;
			if (soco)
			{
				if (alarm[0] == -1)
				{
					if (combo_fase == 2) // gancho
					{
						instance_create_depth(x,y,depth,obj_player_gancho,{image_xscale : xscale, dano : 2, pontos : 200})
						combo_fase = 0; // volto pro soco
						sprite_index = spr_player_gancho;
						alarm[0] = tempo_ataque*2
					}else if (combo_fase == 1) // chute
					{
						instance_create_depth(x,y,depth,obj_player_chute,{image_xscale : xscale, dano : 1, pontos : 100})
						combo_fase=2; // vou pro gancho
						alarm[0] = tempo_ataque;
						sprite_index = spr_player_chutando;
					}else if (combo_fase == 0) //soco
					{
						instance_create_depth(x,y,depth,obj_player_soco,{image_xscale : xscale, dano : 1, pontos : 50})
						combo_fase=1; // vou pro chute
						sprite_index = spr_player_socando
						alarm[0] = tempo_ataque
					}
				}
			}
		break;
		#endregion
	
		#region recebendo_dano	
		case "recebendo_dano":
			image_angle = lerp(image_angle,0,.1);
			z_pos = lerp(z_pos,0,.1);
			combo_fase = 0;
			tempo_combo=tempo_padrao;
		
			if (hp<=0)
			{
				estado = "knockback";
			}else{
				if (alarm[2] == -1) 
				{
					alarm[2] = 20;
				}
			}
			sprite_index = spr_player_tomando_dano;
		break;
		#endregion
	
		#region knockback
	
		case "knockback":
			sprite_index = spr_player_tomando_dano;
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
					if (hp>0)
					{
						estado = "caido";
					}else{
						estado = "morto";
					}
					z_pos = 0;
					z_pos_add = -2;
				}
			}
			image_angle+=2.2 * xscale;
			velh = xscale*2*-1;
			velv = 0;
	
		break;
	
		#endregion
	
		#region caido
		case "caido":
			z_pos = lerp(z_pos,0,.1);
			velv = 0;
			velh = 0;
			if (alarm[3]==-1) alarm[3] = room_speed;
			sprite_index = spr_player_tomando_dano;
		break;
		#endregion
	
		#region levantando
		case "levantando":
			z_pos = lerp(z_pos,0,.1);
			//velv=-1;
			image_angle = lerp(image_angle,0,.1);
			if (round(image_angle)==0) estado = "parado";
			sprite_index = spr_player_tomando_dano;
		break;
		#endregion
	
		#region especial
		case "especial":
		image_angle = lerp(image_angle,0,.1);
			var x_ = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
			if (x!=clamp(x,x_-1,x_+1))
			{
				z_pos = lerp(z_pos,-15,.1);
				x = lerp(x,x_,.1);
				y = lerp(y,room_height-32-sprite_height/2,.1);
			}else{
				z_pos = lerp(z_pos,-15,.1);
				if (alarm[1]==-1)
				{
					espaco_pranchetas = 32;
		
					//criando pranchetas
					for (var i = 1; i < 7; i++)
					{
						if (i mod 2 == 0)
						{	
							value = 1;
						}else{
							value = -1;
						}
						if (i <=3) // pranchetas direitas
						{
							var definicoes = 
							{
								x_destino : x+espaco_pranchetas * i,
								angle_add : value
							}
						}else{ // pranchetas esquerdas
							var definicoes = 
							{
								x_destino : x+-espaco_pranchetas * (i-3),
								angle_add : value
							}
						}
						instance_create_depth(x,y,depth-1,obj_prancheta,definicoes);
					}
					audio_play_sound(snd_especial,2,0)
					alarm[1] = room_speed * 3;
				}
			}
		break;
		#endregion
	
		#region morto 
			case "morto":
			depth=-200;
			instance_destroy(obj_hud);
			instance_create_depth(x,y,-100,obj_morte);
			break;
		#endregion
	}
}

if (velh!=0) && (estado!="knockback") && (estado!="caido") && (estado!="levantando") && (estado!="morto")
{
	xscale = sign(velh);
}