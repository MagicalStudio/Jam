if (point_distance(x,y,obj_player.x,y) > distancia_para_abrir) && (image_index == 0) && (obj_player.x > x)
{
	image_index++;
	repeat(quantidade_inimigos)
	{
		var x_ = irandom_range(bbox_left,bbox_right)
		if (possiveis_inimigos == 1) var inimigo = obj_inimigo_01;
		if (possiveis_inimigos == 2) var inimigo = obj_inimigo_02;
		if (possiveis_inimigos == 3) var inimigo = choose(obj_inimigo_01,obj_inimigo_02);
		instance_create_depth(x_,y+irandom_range(0,15),depth,inimigo);
	}
	audio_play_sound(snd_porta,0,0);
}

//asd