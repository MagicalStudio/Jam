if (obj_chefe.estado!="morto")
{
	quantidade_inimigos = 1
	possiveis_inimigos = irandom_range(1,2);
	repeat(quantidade_inimigos)
	{
		var x_ = irandom_range(bbox_left,bbox_right)
		if (possiveis_inimigos == 1) var inimigo = obj_inimigo_01;
		if (possiveis_inimigos == 2) var inimigo = obj_inimigo_02;
		instance_create_depth(x_,y+irandom_range(0,15),depth,inimigo);
	}

	image_index = 1;
	if (!audio_is_playing(snd_porta)) audio_play_sound(snd_porta,0,0);

	alarm[1] = room_speed;
}