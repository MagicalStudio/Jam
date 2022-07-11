///@desc criar area de ataque

if (estado=="atacar")
{
	ataque = "taser";
	switch(ataque)
	{
		case "taser":
			instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_02_taser,{image_xscale : xscale})
		break;
		
		case "porrada":
			instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_02_soco,{image_xscale : xscale})
		break;
	}
	var dir = point_direction(x,y,obj_player.x,obj_player.y)+180;
	x_y_voltar=[x+lengthdir_x(60,dir),y+lengthdir_y(60,dir)];
	estado = "voltar";
	alarm[4] = room_speed*1.5;
}