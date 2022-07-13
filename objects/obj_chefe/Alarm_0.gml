///@desc escolher ataque
if (estado != "fragilizado")
{
	if (ataque != "0")
	{
		estado = "atacando";
		ataque = choose("impressora","chifre","pulo");

		if (ataque == "pulo")
		{
			alarm[2] = room_speed *2;
		}

		if (ataque == "impressora") && (instance_exists(obj_impressora_boss_fight))
		{
			ataque = choose("chifre","pulo");
		}
	}else{
		estado = "atacando";
		ataque = "impressora";
	}
}