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
	instance_activate_object(obj_controle_vida_e_energia);
}else{
	draw_surface_stretched(surf,camx,camy,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}

draw_sprite_ext(spr_demitido,0,camx+camw/2,room_height/2,xscale,yscale,0,c_white,1);

if (xscale>1)
{
	xscale-=.1;
}else{
	draw_set_font(fnt_calibri)
	draw_set_halign(fa_center);
	for (var i = 0; i < array_length(opcoes); i++)
	{
		if (i == 0) var x_add = -50;
		else var x_add = 50;
		
		draw_set_color(c_black);
		draw_text(camx+camw/2+x_add-1,100,opcoes[i]); 
		draw_text(camx+camw/2+x_add+1,100,opcoes[i]); 
		draw_text(camx+camw/2+x_add,101,opcoes[i]); 
		draw_text(camx+camw/2+x_add,99,opcoes[i]); 
		if (i == opcao) draw_set_color(c_yellow);
		else draw_set_color(c_white);
		draw_text(camx+camw/2+x_add,100,opcoes[i]); // principal
		draw_set_color(c_white);
		
		if (keyboard_check(vk_left)) opcao--;
		if (keyboard_check(vk_right)) opcao++;
		
		opcao = clamp(opcao,0,1);
		
		if (keyboard_check(vk_space)) or (keyboard_check(ord("C")))
		{
			switch(opcoes[opcao])
			{
				case "Menu":
					if (!instance_exists(obj_transicao))
					{
						transicao(rm_menu)
					}
				break;
				
				case "Reiniciar":
					if (!instance_exists(obj_transicao))
					{
						if (room == rm_corredor)
						{
							if (!instance_exists(obj_transicao))
							{
								reiniciar();
							}
						}
						
						if (room == rm_sala_do_boss)
						{
							if (!instance_exists(obj_transicao))
							{
								if (instance_exists(obj_player))
								{
									instance_destroy(obj_player);
								}
								transicao(rm_sala_do_boss_restart);
							}
						}
						
						if (room == rm_sala_do_boss_restart)
						{
							if (!instance_exists(obj_reiniciar))
							{
								reiniciar();
							}
						}
					}
				break;
			}
		}
	}
	draw_set_halign(-1);
	draw_set_font(-1)
}
yscale = xscale