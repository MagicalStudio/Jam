switch(estado)
{
	#region parado
	case "parado":
		caindo = false;
		velv = 0;
		velh = 0;
		if (alarm[0]==-1)
		{
			alarm[0]=room_speed*2;
		}
	break;
	#endregion
	
	#region atacando
	case "atacando":
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
				velh = lengthdir_x(spd*3,direcao_correr);
				velv = lengthdir_y(spd*3,direcao_correr);
				
				var player = instance_place(x,y,obj_player)
				if (player)
				{
					if (depth>player.depth) && (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando")
					{
						player.estado = "knockback";
					}
				}
			break;
			#endregion
			
			#region pulo				
			case "pulo":
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
				alarm[1] = room_speed/4;
			break;
			#endregion
		}
 	break;
	#endregion
}