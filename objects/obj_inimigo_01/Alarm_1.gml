///@desc criar area de ataque

if (estado=="atacar")
{
	instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_01_soco,{image_xscale : xscale})
	estado = "ataquei";
	alarm[4] = room_speed;
}