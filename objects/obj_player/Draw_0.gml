draw_sprite(spr_sombra,0,x,bbox_bottom)
draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,1);

if (alarm[2] > 0)
{
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,.5);
	gpu_set_fog(false,c_white,0,1);
}
