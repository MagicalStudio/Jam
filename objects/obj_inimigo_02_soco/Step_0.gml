if (!global.especial_ativo)
{
	var player = instance_place(x,y,obj_player)

	if (player)
	{
		if (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando") && (player.estado!="especial")
		{
			player.hp -= dano;
			player.estado = "recebendo_dano";
			if (!audio_is_playing(snd_soco_inimigo))
			{
				audio_play_sound(snd_soco_inimigo,0,0);
			}
			instance_create_depth(x,y,depth,obj_impacto);
			
			if (!audio_is_playing(snd_player_dano))
			{
				audio_play_sound(snd_player_dano,1,0);
			}
		}
	}
}

instance_destroy();