draw_sprite(spr_sombra,0,x,bbox_bottom)

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,1,1,image_angle,c_white,image_alpha);
if (alarm[2] > 0) && (!destruido)
{
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_red,.5);
	gpu_set_fog(false,c_white,0,1);
}

/*
draw_set_color(c_black);
draw_ellipse(x-45,y-10,x+45,y+10,false)
draw_set_color(c_white);