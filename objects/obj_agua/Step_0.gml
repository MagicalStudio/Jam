if (y<y_destino)
{
	y++
}else{
	var player = instance_place(x,y,obj_player)
	if (player) && (obj_player.hp < obj_player.hp_max)
	{
		instance_destroy();
		player.hp+=player.hp_max * 25 / 100;
		player.hp = clamp(player.hp,0,player.hp_max);
		audio_play_sound(snd_cafe,3,false)
	}
}