if (instance_inside_view_camera(view_camera[0]))
{
	hp -= global.especial_dano;
	global.score += global.pontos_especial;
	criar_pop_up("+"+string(global.pontos_especial),x,y-sprite_height);
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

	if (hp<=0)
	{
		instance_destroy();
	}

	alarm[2] = 30; 
}