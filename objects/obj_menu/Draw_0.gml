draw_set_font(fnt_calibri)
draw_set_halign(fa_center);
if (room == rm_menu)
{
	draw_text(room_width/2,100,"ESPAÇO para iniciar");
	draw_text(room_width/2,85,"ESC Créditos");
	draw_text(room_width/2,115,"F11 Tela Cheia");
}else{
	
}
draw_set_font(-1)
draw_set_halign(-1);

if (keyboard_check_pressed(vk_f11))
{
	if (!window_get_fullscreen())
	{
		window_set_fullscreen(true);
	}else{
		window_set_fullscreen(false);
	}
}