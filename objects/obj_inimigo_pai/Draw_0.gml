draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,1);

if (alarm[2] > 0) or (z_pos!=0)
{
	gpu_set_fog(true,c_red,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_red,.5);
	gpu_set_fog(false,c_white,0,1);
	
	/*
	var x_ = x-sprite_get_width(spr_barra_de_vida_inimigo)/2
	var y_ = y-25
	draw_sprite(spr_barra_de_vida_inimigo,1,x_,y_);
	vida_hud = (hp / hp_max) * sprite_get_width(spr_barra_de_vida_inimigo);
	draw_sprite_part(spr_barra_de_vida_inimigo,0,0,0,vida_hud,sprite_get_height(spr_barra_de_vida_inimigo),x_,y_)
	*/
}
