///@desc atacando
if (estado!="fragilizado")
{
	if (ataque=="chifre")
	{
		direcao_correr = point_direction(x,y,obj_player.x,obj_player.y);
		estado = "atacar";
	}

	estado = "atacar";
}