///@desc atacando
if (estado!= "fragilizado") && (estado!= "morto")&& (estado!="knockback") && (estado != "levantando") && (estado != "caido")
{
	if (ataque=="chifre")
	{
		direcao_correr = point_direction(x,y,obj_player.x,obj_player.y);
	}

	estado = "atacar";
}