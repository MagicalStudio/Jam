draw_sprite(spr_hq,hq,x,y);
spw = sprite_get_width(spr_hq)

draw_set_font(fnt_hq)

if (hq<2)
{
	if (hq == 0) var mult = 1.1;
	if (hq == 1) var mult = 1.1;
	
	var text = string_copy(capitulos_da_novela[hq],1,count)
	var sep = string_height(capitulos_da_novela[hq]);
	draw_text_ext(x+spw*mult,y,text,sep,400);
	
	if (count != string_length(capitulos_da_novela[hq]))
	{
		count+=.5;
	}else{
		if (alarm[0] == -1) alarm[0] = room_speed*3;
	}
}

draw_set_font(-1)