if (desenhar_aviso) && (xscale >=1)
{
	draw_sprite(spr_perigo,0,x,32);
}

if (xscale >= 1) draw_sprite(spr_sombra,0,x,y+sprite_height/2)

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,xscale,image_angle,c_white,image_alpha);
if (alarm[2] > 0) && (!destruido)
{
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,xscale,image_angle,c_red,.5);
	gpu_set_fog(false,c_white,0,1);
}

