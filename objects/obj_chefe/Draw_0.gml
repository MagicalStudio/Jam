draw_sprite(spr_sombra,0,x,(y+sprite_height/2));

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,image_alpha);

/*
draw_set_color(c_black)
draw_text(x,y-sprite_height,estado);
draw_text(x,y-sprite_height*1.5,ataque);
draw_set_color(c_white)

draw_rectangle(bbox_left,y,bbox_right,y+30,false)
*/

if (brilho!=0)
{
	if (potencia_do_brilho!=clamp(potencia_do_brilho,0,1))
	{
		audio_play_sound(snd_transformacao,1,0);
		potencia_do_brilho_add*=-1;
	}
	
	potencia_do_brilho+=potencia_do_brilho_add
	
	gpu_set_fog(true,brilho,0,1);
	draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,potencia_do_brilho);
	gpu_set_fog(false,c_white,0,0);
}else{
	potencia_do_brilho_add = .025;
	potencia_do_brilho = 0;
}