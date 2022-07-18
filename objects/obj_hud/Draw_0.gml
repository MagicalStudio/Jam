var cam_x = camera_get_view_x(view_camera[0]);
draw_sprite(spr_rosto_personagem,0,cam_x+1,1);
//desenhando vida
draw_sprite(spr_barra_de_vida,1,cam_x+1+sprite_get_width(spr_rosto_personagem),2);
vida_hud = (obj_player.hp / obj_player.hp_max) * sprite_get_width(spr_barra_de_vida)-1;
draw_sprite_part(spr_barra_de_vida,0,0,0,vida_hud,sprite_get_height(spr_barra_de_vida),cam_x+1+sprite_get_width(spr_rosto_personagem),2);
//desenhando energia
draw_sprite(spr_barras_de_energia,obj_player.energia,cam_x+1+sprite_get_width(spr_rosto_personagem),1+sprite_get_height(spr_barra_de_vida))

if (instance_exists(obj_chefe)) // desenhando vida do boss
{
	var width_spr = sprite_get_width(spr_barra_de_vida_boss)
	draw_sprite(spr_rosto_boss,0,room_width-1,1);
	//desenhando vida
	draw_sprite(spr_barra_de_vida_boss,1,room_width-1-width_spr-sprite_get_width(spr_rosto_personagem),2);
	vida_hud = (obj_chefe.hp / obj_chefe.hp_max) * width_spr;
	
	draw_sprite_part(spr_barra_de_vida_boss,0,vida_hud-width_spr,0,width_spr,sprite_get_height(spr_barra_de_vida),room_width-1-width_spr-sprite_get_width(spr_rosto_personagem),2);
}

// nem lembro mais oq isso faz.
if (instance_exists(obj_inimigo_pai))
{
	if (room == rm_corredor) && (cam_x < 1240)
	{
		if (!enemy_is_inside_view_camera(view_camera[0]))
		{
			draw_sprite(spr_seta_go,0,cam_x+camera_get_view_width(view_camera[0])-48,room_height/2)
		}
	}
}else{
	if (room == rm_corredor)
	{
		obj_camera.x_add = lerp(obj_camera.x_add,100,.25);
		draw_sprite(spr_seta_go,0,cam_x+camera_get_view_width(view_camera[0])-48,room_height/2)
	}
}