if (!global.especial_ativo)
{
	switch(estado)
	{
		#region parado
		case "parado":
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
			switch(ataque)
			{
				#region chifre
				case "chifre":
					z_pos = lerp(z_pos,0,.1);
					var vel_ = 2;
					velh = lengthdir_x(spd*vel_,direcao_correr);
					velv = lengthdir_y(spd*vel_,direcao_correr);
				
					var player = instance_place(x,y,obj_player)
					if (player)
					{
						if (depth>player.depth) && (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando")
						{
							player.estado = "knockback";
							player.xscale = xscale;
							player.hp -= dano;
						}
					}
				
					// destruir impressora
					var impressora = instance_place(x,y,obj_impressora_boss_fight)
					if (impressora)
					{
						if (depth>impressora.depth)
						{
							impressora.hp=0;
						}
					}
				break;
				#endregion
			
				#region pulo				
				case "pulo":
					if (obj_player.x > x) xscale  = 1;
					else xscale = -1;
					if (point_distance(x,y,obj_player.x,obj_player.y-5) > 3) && (!caindo)
					{
						var dir = point_direction(x,y,obj_player.x,obj_player.y-5);
						velh = lengthdir_x(spd * 1.5,dir);
						velv = lengthdir_y(spd * 1.5,dir);
						z_pos = lerp(z_pos,-45,.1);
					}else{
						caindo = true;
					}
				
					if (caindo == true)
					{
						timer_cair-=5;
						velv = 0;
						velh = 0;
						if (timer_cair > 0) z_pos = lerp(z_pos,-45,.1);
					
						if (timer_cair<=0)
						{
							z_pos += 5;
							if (z_pos>=0)
							{
								z_pos = 0
								if (collision_rectangle(bbox_left,y-15,bbox_right,y-7,obj_player,true,true))
								{
									if  (obj_player.depth < depth) && (obj_player.estado!="knockback") && (obj_player.estado!="caido") && (obj_player.estado!="levantando")
									{
										obj_player.estado = "knockback";
										obj_player.xscale = xscale;
										obj_player.hp -= 3;
									}  
								}
							
								if (collision_rectangle(bbox_left,y-15,bbox_right,y-7,obj_impressora_boss_fight,true,true))
								{
									if  (obj_impressora_boss_fight.depth < depth)
									{
										obj_impressora_boss_fight.hp = 0;
									}  
								}
								estado = "parado";
								caindo = false;
								timer_cair = room_speed;
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
					}
				break;
				#endregion
			}
	 	break;
		#endregion
	
		#region fragilizado
		case "fragilizado":
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
	
				instance_create_depth(x,y,depth,obj_impacto);
				
				quantidade_de_golpes_tomados++;
				hp-=colisao.dano;
				if (quantidade_de_golpes_tomados==3) 
				{
					quantidade_de_golpes_tomados = 0;
					estado = "parado";
				}
			}
		break;
		#endregion	
	}
}else{
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