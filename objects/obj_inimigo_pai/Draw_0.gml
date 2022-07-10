
draw_text(x,y-50,estado)
draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,1);
if (alarm[2] > 0) or (z_pos!=0)
{
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_red,.5);
	gpu_set_fog(false,c_white,0,1);
}
