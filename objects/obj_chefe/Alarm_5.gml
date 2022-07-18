if (instance_inside_view_camera(view_camera[0]))
{
	hp --
	if (hp <= 0) 
	{
		estado = "knockback";
		if (instance_exists(obj_inimigo_pai))
		{
			instance_destroy(obj_inimigo_pai);
		}
	}
	
	audio_play_sound(snd_boss_dano,5,0)
	xscale *=-1;

	if (!audio_is_playing(snd_soco))
	{
		audio_play_sound(snd_soco,1,false);
	}
	
	audio_play_sound(snd_soco,3,0);
	
	repeat(3)
	{
		var x_ = irandom_range(bbox_left,bbox_right);
		var y_ = irandom_range(bbox_bottom,bbox_top);
		instance_create_depth(x_,y_,depth,obj_impacto);
	}
}