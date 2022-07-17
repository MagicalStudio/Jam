draw_sprite(spr_sombra,0,x,bbox_bottom);

draw_sprite_ext(sprite_index,image_index,x,y+z_pos,xscale,yscale,image_angle,c_white,image_alpha);


draw_set_color(c_black)
draw_text(x,y-sprite_height,estado);
draw_text(x,y-sprite_height*1.5,ataque);
draw_set_color(c_white)

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)