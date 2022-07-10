global.min_x = camera_get_view_x(cam);

if (instance_exists(obj_inimigo_pai))
{
	if (enemy_is_inside_view_camera(cam))
	{
		x_add = lerp(x_add,0,.12);
	}else{
		x_add = lerp(x_add,100,.25);
	}
}

x = lerp(x,alvo.x+x_add,.025);

show_debug_message(x_add)
x = clamp(x,global.min_x + width/2, room_width);