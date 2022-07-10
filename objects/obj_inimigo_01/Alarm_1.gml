///@desc criar area de ataque

if (estado=="atacar")
{
	var dir = point_direction(x,y,obj_player.x,obj_player.y)+180;
	x_y_voltar=[x+lengthdir_x(60,dir),y+lengthdir_y(60,dir)];
	instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_inimigo_01_soco,{image_xscale : xscale})
	estado = "voltar";
	alarm[4] = room_speed*1.5;
}