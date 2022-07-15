draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_color(c_white);
draw_set_alpha(1);

fade+=fade_add;
if (fade >= 1)
{
	fade_add*=-1
	room_goto(proxima_room);
}
if (fade <= 0)
{
	instance_destroy();
}

depth = -3000;