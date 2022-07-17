alpha-=.05;
depth = obj_hud.depth+1;

if (alpha<=0)
{
	instance_destroy();
}else{
	draw_set_alpha(alpha);
	draw_set_color(c_aqua);
	var x_ = camera_get_view_x(view_camera[0]);
	draw_rectangle(x_,0,x_+camera_get_view_width(view_camera[0]),room_height,false);
	draw_set_color(c_white);
	draw_set_alpha(1)
}