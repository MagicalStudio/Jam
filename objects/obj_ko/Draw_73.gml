depth = -16000;

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

var camw = camera_get_view_width(view_camera[0]);

if (!surface_exists(surf))
{
	surf = surface_create(view_get_wport(view_camera[0]),view_get_hport(view_camera[0]));
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	surface_copy(surf,0,0,application_surface);
	surface_reset_target();
	instance_deactivate_all(true);

}else{
	draw_surface_stretched(surf,camx,camy,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}

draw_sprite_ext(spr_ko,0,camx+camw/2,room_height/2,xscale,yscale,0,c_white,1);

if (xscale>3)
{
	xscale-=.1;
}else{
	if (alarm[0]==-1)
	{
		alarm[0]=room_speed;
	}
}
yscale = xscale