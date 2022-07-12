switch(estado)
{
	case "parado":
		if (alarm[0] == -1)
		{
			alarm[0] = room_speed*2;
		}
	break;
	
	case "atacando":
		switch(ataque_escolhido)
		{
			case "pulo":
				if (!comeco_atacar)
				{
					comeco_atacar=true;
					seguindo = true;
					caindo = false;
				}else{
					if (seguindo)
					{
						if (point_distance(x,y,obj_player.x,obj_player.y) > 1)
						{
							direcao_correr = point_direction(x,y,obj_player.x,obj_player.y);
							z_pos = lerp(z_pos, -56, .1);
							velh = lengthdir_x(spd*3,direcao_correr);
							velv = lengthdir_y(spd*3,direcao_correr);
						}else{
							velv = 0;
							velh = 0;
							direcao_correr = 0;
							x = obj_player.x;
							y = obj_player.y;
							seguindo = false;
						}
					}else{
						if (!caindo)
						{
							if (alarm[3]==-1) alarm[3] = room_speed;
						}else{
							z_pos+=4;
							if (z_pos >= 0)
							{
								z_pos = 0;
								estado = "parado";
							}
						}
					}
				}
			break;
			
			case "chifre":
				if (!comeco_atacar)
				{
					if (alarm[1] == -1) alarm[1] = room_speed/2//tempo para começar atacar
				}else{
					velh = lengthdir_x(spd*4,direcao_correr);
					velv = lengthdir_y(spd*4,direcao_correr);
					
					if (place_meeting(x+velh*2,y,obj_colisao)) or (place_meeting(x,y+velv*2,obj_colisao))
					{
						estado = "parado";
						velv = 0;
						velh = 0;
						comeco_atacar = false;
					}
					
				}
			break;
  		}
	
	break;
}

show_debug_message(estado);