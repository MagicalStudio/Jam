draw_sprite(spr_hq,hq,x,y);
spw = sprite_get_width(spr_hq)

draw_set_font(fnt_hq)

if (hq<2)
{
	var text = string_copy(capitulos_da_novela[hq],1,count)
	var sep = string_height(capitulos_da_novela[hq]);
	draw_text_ext(x+spw*1.1,y,text,sep,400);
	
	if (count != string_length(capitulos_da_novela[hq]))
	{
		count+=.5;
	}else{
		if (alarm[0] == -1) alarm[0] = room_speed*3;
	}
	
}else{
	
}

draw_set_font(-1)