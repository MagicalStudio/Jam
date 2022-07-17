draw_set_font(fnt_calibri)
draw_set_halign(fa_center);
if (room == rm_menu)
{
	if (surf!=-1)
	{
		surface_free(surf);
		surf = -1;
	}
	draw_set_color(c_black)
	draw_text(room_width/2-1,100,"ESPAÇO para iniciar");
	draw_text(room_width/2+1,100,"ESPAÇO para iniciar");
	draw_text(room_width/2,101,"ESPAÇO para iniciar");
	draw_text(room_width/2,99,"ESPAÇO para iniciar");
	
	draw_text(room_width/2-1,85,"ESC Créditos");
	draw_text(room_width/2+1,85,"ESC Créditos");
	draw_text(room_width/2,84,"ESC Créditos");
	draw_text(room_width/2,86,"ESC Créditos");
	
	draw_text(room_width/2+1,115,"F11 Tela Cheia");
	draw_text(room_width/2-1,115,"F11 Tela Cheia");
	draw_text(room_width/2,116,"F11 Tela Cheia");
	draw_text(room_width/2,114,"F11 Tela Cheia");
	draw_set_color(c_white)
	draw_text(room_width/2,100,"ESPAÇO para iniciar");
	draw_text(room_width/2,85,"ESC Créditos");
	draw_text(room_width/2,115,"F11 Tela Cheia");
}else{
	draw_set_font(fnt_calibri_creditos)
	draw_set_halign(fa_left);
	//desenhando slider
	var text = "ESC para voltar\n\nDesenvolvedores:\ndumb\nOskar\nMegastrons\n\nSound Effects:\nopengameart.org/content/explosion-0\n\nMusicas:\nopengameart.org/content/jazz-n-brass-loop\nopengameart.org/content/icy-game-over\n\nSprites:\nansimuz.itch.io/explosion-animations-pack";
	valor = create_slider(spr_slider,spr_button,valor,string_height(text)-room_height,room_width-10,10);
	if (!surface_exists(surf))
	{
		surf = surface_create(room_width,string_height(text));
	}else{
		surface_set_target(surf);
		draw_text(0,0,text);
		surface_reset_target();
		draw_surface_part(surf,0,valor,room_width,room_height,0,0);
	}
}
draw_set_font(-1)
draw_set_halign(fa_left);

if (keyboard_check_pressed(vk_f11))
{
 	if (!window_get_fullscreen())
	{
		window_set_fullscreen(1);
	}else{
		window_set_fullscreen(0);
	}
}