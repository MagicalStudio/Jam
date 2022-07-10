if (y<y_destino)
{
	y++
}else{
	var player = instance_place(x,y,obj_player)
	if (player) && (obj_player.energia < 12)
	{
		instance_destroy();
		player.energia+=3;
		player.energia = clamp(player.energia,0,12);
	}
}