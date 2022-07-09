draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,c_white,1);

if (tempo_brilhando > 0)
{
	tempo_brilhando-=.1;
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,c_red,.5);
	gpu_set_fog(false,c_white,0,1);
}
