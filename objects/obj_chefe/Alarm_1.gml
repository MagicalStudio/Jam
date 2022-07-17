///@desc atacando
if (estado!= "fragilizado") && (estado!= "morto")&& (estado!="knockback") && (estado != "levantando") && (estado != "caido")
{
	if (ataque=="chifre")
	{
		sprite_index = spr_chefe_forte_correndo;
		image_speed = 0;
		image_index = 0;
		direcao_correr = point_direction(x,y,obj_player.x,obj_player.y);
	}

	estado = "atacar";
}