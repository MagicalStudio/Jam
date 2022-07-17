if (!global.especial_ativo)
{
	if (hp<=0) estado = "morto";
	switch(estado)
	{
		
		#region dialogo
		case "dialogo":
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
			
			if (audio_is_playing(msc_corredor))
			{
				if (audio_sound_get_gain(msc_corredor) == 0)
				{
					audio_stop_sound(msc_corredor);
					audio_play_sound(dia_chefe,1,0);
					conversei = true;
				}
			}
			
			if (conversei) && (!audio_is_playing(dia_chefe))
			{
				if (alarm[10] == -1) alarm[10]=room_speed/2;
			}
			
			if (obj_esposa.morrer == true)
			{
				sprite_index = spr_chefe_comendo;
			}
			
		break;
		#endregion
		
		#region engolindo
			case "engolindo":
			sprite_index = spr_chefe_saboreando;
			brilho = c_aqua;
			if (alarm[7]==-1)
			{
				alarm[7]=room_speed*2;
			}
			break;
		#endregion
		
		#region transformando
		case "transformando":
			if (alarm[6]==-1) alarm[6] = room_speed*3;
			brilho = c_aqua;
		break;
		#endregion
		
		#region parado
		case "parado":
			brilho = 0;
			if (obj_player.estado == "cutscene")
			{
				obj_player.estado = "parado";
			}
			sprite_index = spr_chefe_forte_parado;
			if (!audio_is_playing(msc_boss_fight))
			{
				audio_play_sound(msc_boss_fight,0,true)
			}
			image_angle = lerp(image_angle,0,.1);
			caindo = false;
			velv = 0;
			velh = 0;
			
			z_pos = lerp(z_pos,0,.1);
			
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
		
			if (alarm[0]==-1)
			{
				alarm[0]=room_speed*3;
			}
		break;
		#endregion
	
		#region atacando
		case "atacando":
			image_angle = lerp(image_angle,0,.1);
			z_pos = lerp(z_pos,0,.1);
			if (obj_player.x > x) xscale  = 1;
			else xscale = -1;
			if (alarm[1] == -1)
			{
				caindo = false;
				switch(ataque)
				{
					case "chifre":
						 alarm[1] = room_speed;
					break;
		
					case "pulo":
						alarm[1] = room_speed/2;
					break;
		
					case "impressora":
						alarm[1] = room_speed/4;
					break;
				}
			}
		break;
		#endregion
	
		#region atacar
		case "atacar":
			image_angle = lerp(image_angle,0,.1);
			switch(ataque)
			{
				#region chifre
				case "chifre":
					image_speed = 1;
					z_pos = lerp(z_pos,0,.1);
					var vel_ = 3;
					velh = lengthdir_x(spd*vel_,direcao_correr);
					velv = lengthdir_y(spd*vel_,direcao_correr);
				
					var player = instance_place(x,y,obj_player)
					if (player)
					{
						var distancia_depth = abs(abs(depth)-abs(player.depth))
						if (distancia_depth<20) && (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando")
						{
							player.estado = "knockback";
							player.xscale = xscale;
							player.hp -= dano;
							if (!audio_is_playing(snd_player_dano))
							{
								audio_play_sound(snd_player_dano,1,false);
							}
						}
					}
				
					// destruir impressora
					var impressora = instance_place(x,y,obj_impressora_boss_fight)
					if (impressora)
					{
						var distancia_depth = abs(abs(depth)-abs(impressora.depth))
						if (distancia_depth<20)
						{
							impressora.hp=0;
						}
					}
				break;
				#endregion
			
				#region pulo				
				case "pulo":
				if (alarm[8]==-1)
				{
					if (obj_player.x > x) xscale  = 1;
					else xscale = -1;
					if (point_distance(x,y,obj_player.x,obj_player.y-5) > 3) && (!caindo)
					{
						sprite_index = spr_chefe_forte_pulando;
						var dir = point_direction(x,y,obj_player.x,obj_player.y-5);
						velh = lengthdir_x(spd * 1.5,dir);
						velv = lengthdir_y(spd * 1.5,dir);
						z_pos = lerp(z_pos,-45,.1);
					}else{
						caindo = true;
					}
				
					if (caindo == true)
					{
						sprite_index = spr_chefe_forte_bumdada;
						timer_cair-=5;
						velv = 0;
						velh = 0;
						if (timer_cair > 0) z_pos = lerp(z_pos,-45,.1);
					
						if (timer_cair<=0)
						{
							z_pos += 5;
							if (z_pos>=0)
							{
								z_pos = 0;
								
								instance_create_depth(0,0,0,obj_screen_shake)
			
									if (collision_rectangle(bbox_left,y,bbox_right,y+30,obj_player,true,true))
									{
										var distancia_depth = abs(abs(depth)-abs(obj_player.depth))
										if  (distancia_depth<20) && (obj_player.estado!="knockback") && (obj_player.estado!="caido") && (obj_player.estado!="levantando")
										{
											obj_player.estado = "knockback";
											obj_player.xscale = xscale;
											obj_player.hp -= 3;
											if(!audio_is_playing(snd_player_dano))
											{
												audio_play_sound(snd_player_dano,1,0);
											}
										}  
									}
							
									if (collision_rectangle(bbox_left,y,bbox_right,y+30,obj_impressora_boss_fight,true,true))
									{
										var distancia_depth = abs(abs(depth)-abs(obj_impressora_boss_fight.depth))
										if  (distancia_depth < 20)
										{
											obj_impressora_boss_fight.hp = 0;
										}  
									}
									
									instance_create_depth(0,0,0,obj_screen_shake);
									audio_play_sound(snd_queda,1,0);
								
									caindo = false;
									timer_cair = room_speed;
									alarm[8]=room_speed
								}
							}
						}
					}
				break;
				#endregion
			
				#region impressora
				
				case "impressora":
					z_pos = lerp(z_pos,0,.1);
					if (obj_player.x > x) xscale  = 1;
					else xscale = -1;
					if (!instance_exists(obj_impressora_boss_fight))
					{
						instance_create_depth(-100,-100,depth,obj_impressora_boss_fight);
						alarm[3] = room_speed * 3;
					}else{
						obj_impressora_boss_fight.xscale+=.010;
					}
				break;
				#endregion
			}
	 	break;
		#endregion
	
		#region fragilizado
		case "fragilizado":
			if (alarm[9]==-1)
			{
				sprite_index = spr_chefe_forte_fragilizado;
				image_angle = lerp(image_angle,0,.1);
				z_pos = lerp(z_pos,0,.1);
				velv = 0;
				velh = 0;
				var colisao = collision_rectangle(bbox_left,bbox_top,bbox_right,y,obj_player_golpe,true,true);
				if (colisao)
				{
					if (!audio_is_playing(snd_soco))
					{
						audio_play_sound(snd_soco,1,false);
					}
					audio_play_sound(snd_boss_dano,1,0)
				
					instance_create_depth(x,y,depth,obj_impacto);
				
					quantidade_de_golpes_tomados++;
					hp-=colisao.dano;
				
					if (hp <= 0)
					{
						if (instance_exists(obj_inimigo_pai))
						{
							instance_destroy(obj_inimigo_pai);
						}
					
						estado = "morto";
					}
				
					if (quantidade_de_golpes_tomados==3) 
					{
						quantidade_de_golpes_tomados = 0;
						if (colisao.object_index == obj_player_gancho)
						{
							estado = "knockback";
							xscale = sign(obj_player.x-x);
						}else{
							estado = "parado";
						}
					}
				}
			}
		break;
		#endregion	
		
		#region knockback
		case "knockback":
			sprite_index = spr_chefe_forte_tomando_dano;
			z_pos+=z_pos_add;
			if (z_pos>-5) && (subir)
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
			image_angle+=4 * xscale;
			velh = xscale*-1;
			velv = 0;

		break;
		#endregion
		
		#region caido
		sprite_index = spr_chefe_forte_tomando_dano;
		case "caido":
			velv = 0;
			velh = 0;
			if (alarm[4]==-1) alarm[4] = room_speed;
		break;
		#endregion
	
		#region levantando
		case "levantando":
			sprite_index = spr_chefe_forte_tomando_dano;
			image_angle = lerp(image_angle,0,.1);
			if (round(image_angle)==0) estado = "parado";
		break;
		#endregion
		
		#region morto
		case "morto":
			sprite_index = spr_chefe_forte_tomando_dano;
			z_pos = lerp(z_pos,0,.1);
			image_angle = lerp(image_angle,0,.1);
			var colisao = collision_rectangle(bbox_left,bbox_top,bbox_right,y,obj_player_golpe,true,true);
			if (colisao) 
			{
				if (!instance_exists(obj_ko))
				{
					instance_create_depth(x,y,depth,obj_impacto);
					instance_create_depth(0,0,depth,obj_ko);
				}
			}
		break;
		#endregion
	}
}else{
	sprite_index = spr_chefe_forte_tomando_dano;
	z_pos = lerp(z_pos,0,.1);
	if (alarm[5] == -1) && (instance_exists(obj_prancheta))
	{
		alarm[5] = 30;
	}
	//estado
	estado = "parado";
	
	//chifre
	direcao_correr = 0;

	//pulo
	caindo = false;
	timer_cair = room_speed;
	
}