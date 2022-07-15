///@func create_slider
///@arg sprite_background 
///@arg sprite_button
///@arg value
///@arg total_value
///@arg x
///@arg y
function create_slider(){

	var spr_back    = argument0;
	var spr_butt    = argument1;
	var value       = argument2;
	var _x			= argument4;
	var _y			= argument5;
	var total_value = argument3;

	//desenhando fundo do slider
	var spr_back_w = sprite_get_width(spr_back);
	var spr_back_h = sprite_get_height(spr_back);
	draw_sprite(spr_slider,0,_x,_y)
	//obtendo a largura que o slider está "esticado"
	var width = (value * spr_back_h) / total_value;

	//desenhando o botão
	var _xbutton = _x;
	var _ybutton = _y+width;
	draw_sprite(spr_butt,0,_xbutton,_ybutton)

	//verificando se o mouse está dentro do slider
	if (point_in_rectangle(mouse_x,mouse_y,0,_y,room_width,_y+spr_back_h))
	{
		//movendo o slider
		if (mouse_check_button(mb_left))
		{
			var click_pos = abs(mouse_y-_y)
			var porcentagem_da_pos = click_pos / spr_back_h * 100;
			var porcentagem  = total_value * porcentagem_da_pos / 100;
			value = porcentagem;
			value = clamp(value, 0, total_value)
		}
	}
	// retornando o novo valor
	return value
}