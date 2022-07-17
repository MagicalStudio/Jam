
if (!parar)
{
	image_angle+=xscale*3.2;
	x+=xscale*-1*1.7;
	z_pos+=z_pos_add;
	if (z_pos>-8) && (subindo)
	{
		z_pos_add-=.25;
	}else{
		subindo = false
		z_pos_add+=.25;
		if (z_pos>=0)
		{
			parar = true;
		}
	}
}	

if (alarm[0]==-1)
{
	alpha-=.1;
}

if (alpha<=0)
{
	instance_destroy();
}

draw_set_alpha(alpha)

draw_sprite(spr_sombra,0,x,bbox_bottom-3);

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,1,image_angle,c_white,1);
gpu_set_fog(true,c_grey,0,1);
draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,1,image_angle,c_white,.5);
gpu_set_fog(false,c_white,0,1);

draw_set_alpha(1)