///@desc criar area de ataque
if (estado=="atacar")
{
	switch(ataque)
	{
		case "taser":
			instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_02_taser,{image_xscale : xscale})
		break;
		
		case "porrada":
			instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_02_soco,{image_xscale : xscale})
		break;
	}
	estado = "ataquei";
	alarm[4] = room_speed/2;
}