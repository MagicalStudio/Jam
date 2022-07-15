depth = -300;

if (!surface_exists(surf))
{
	surf = surface_create(view_get_wport(view_camera[0]),view_get_hport(view_camera[0]));
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	surface_copy(surf,0,0,application_surface);
	surface_reset_target();
	instance_deactivate_all(true);
	instance_activate_object(obj_controle_vida_e_energia);
	if (!instance_exists(obj_reiniciar))
	{
		instance_create_depth(0,0,-3000,obj_reiniciar)
	}
}else{
	draw_surface_stretched(surf,0,0,view_get_wport(view_camera[0]),view_get_hport(view_camera[0]))
}
