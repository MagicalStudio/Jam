var cam_x = camera_get_view_x(view_camera[0]);
draw_sprite(spr_rosto_personagem,0,cam_x+1,1);
//desenhando vida
draw_sprite(spr_barra_de_vida,1,cam_x+1+sprite_get_width(spr_rosto_personagem),2);
vida_hud = (obj_player.hp / obj_player.hp_max) * sprite_get_width(spr_barra_de_vida)-1;
draw_sprite_part(spr_barra_de_vida,0,0,0,vida_hud,sprite_get_height(spr_barra_de_vida),cam_x+1+sprite_get_width(spr_rosto_personagem),2);
//desenhando pontos 
if(global.score>10) // eu nao sei fazer melhor que isso kkk
{
	score_desenhar="0000"+string(global.score);
	if (global.score>100)
	{
		score_desenhar="00"+string(global.score);
		if (global.score>1000)
		{
			score_desenhar="00"+string(global.score);
			if (global.score>10000)
			{
				score_desenhar="0"+string(global.score);
			}
		}
	}
}
draw_set_font(fnt_calibri);
draw_set_color(c_black);
draw_set_halign(fa_right)
draw_set_valign(fa_top);
draw_text(cam_x+width_cam-2,3,string(score_desenhar)+" pontos");
draw_text(cam_x+width_cam-2,1,string(score_desenhar)+" pontos");
draw_text(cam_x+width_cam-1,2,string(score_desenhar)+" pontos");
draw_text(cam_x+width_cam-3,2,string(score_desenhar)+" pontos");
draw_set_color(c_yellow);
draw_text(cam_x+width_cam-2,2,string(score_desenhar)+" pontos");
draw_set_color(c_white);
draw_set_halign(-1)
draw_set_valign(-1)
//desenhando energia
draw_sprite(spr_barras_de_energia,obj_player.energia,cam_x+1+sprite_get_width(spr_rosto_personagem),1+sprite_get_height(spr_barra_de_vida))

if (instance_exists(obj_inimigo_pai))
{
	if (!enemy_is_inside_view_camera(view_camera[0]))
	{
		draw_sprite(spr_seta_go,0,cam_x+camera_get_view_width(view_camera[0])-48,room_height/2)
	}
}else{
	if (room == rm_corredor)
	{
		obj_camera.x_add = lerp(obj_camera.x_add,100,.25);
		draw_sprite(spr_seta_go,0,cam_x+camera_get_view_width(view_camera[0])-48,room_height/2)
	}
}