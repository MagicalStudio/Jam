y-=.5;
alpha-=.03;

/*
draw_set_alpha(alpha);
draw_set_color(c_black)
draw_set_halign(fa_center);
draw_text(x,y+1,text);
draw_set_color(c_lime);
draw_text(x,y,text);
draw_set_color(c_white);
draw_set_halign(-1);
draw_set_alpha(1);
*/

if (alpha <= 0) instance_destroy();