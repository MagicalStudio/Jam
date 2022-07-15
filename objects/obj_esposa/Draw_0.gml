if (morrer)
{
	if (!audio_is_playing(snd_aahhh))
	{
		audio_play_sound(snd_aahhh,0,0);
		aahhh = true;
	}
	x = lerp(x,obj_chefe.x,.025);
	z_pos+=z_add;
	if (image_angle<180)
	{
		image_angle+=3.25;
	}
	if (subir)
	{
		if (z_pos < -65)
		{
			subir = false;
			z_add *=-1;
		}
	}else{
		if (z_pos > -21)
		{
			obj_chefe.estado = "engolindo";
			instance_destroy();
		}
	}
}

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,1,1,image_angle,c_white,1)