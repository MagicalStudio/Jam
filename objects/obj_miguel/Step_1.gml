var bebedor = instance_place(x,y,obj_maquina_de_agua);

if (bebedor)
{
	if (bebedor.hp <= 0) && (instance_place(x,y,obj_player_golpe))
	{
		instance_create_depth(x,y,-100,obj_inimigo_voando,{image_xscale:1, sprite_index : sprite_index})
		audio_play_sound(snd_grito,1,0);
		instance_destroy();
	}
}else{
	if (instance_place(x,y,obj_player_golpe))
	{
		instance_create_depth(x,y,-100,obj_inimigo_voando,{image_xscale:1, sprite_index : sprite_index})
		audio_play_sound(snd_grito,1,0);
		instance_destroy();
	}
}
