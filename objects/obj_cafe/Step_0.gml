if (y<y_destino)
{
	y++
}else{
	var player = instance_place(x,y,obj_player)
	if (player) && (obj_player.energia < 3)
	{
		if (!audio_is_playing(snd_cafe)) audio_play_sound(snd_cafe,1,0)
		instance_destroy();
		player.energia+=3;
		player.energia = clamp(player.energia,0,3);
	}
}