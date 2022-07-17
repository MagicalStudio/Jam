if (instance_inside_view_camera(view_camera[0]))
{
	hp --
	if (hp <= 0) 
	{
		estado = "morto";
		if (instance_exists(obj_inimigo_pai))
		{
			instance_destroy(obj_inimigo_pai);
		}
	}
	xscale *=-1;

	if (!audio_is_playing(snd_soco))
	{
		audio_play_sound(snd_soco,1,false);
	}
	
	repeat(3)
	{
		var x_ = irandom_range(bbox_left,bbox_right);
		var y_ = irandom_range(bbox_bottom,bbox_top);
		instance_create_depth(x_,y_,depth,obj_impacto);
	}
}