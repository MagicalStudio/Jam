///@desc escolher ataque
if (ataque != "0")
{
	estado = "atacando";
	ataque = "impressora"//choose("impressora","chifre","pulo");

	if (ataque == "pulo")
	{
		alarm[2] = room_speed *2;
	}

	if (ataque == "impressora") && (instance_exists(obj_impressora))
	{
		ataque = choose("chifre","pulo");
	}
}else{
	ataque = "impressora";
}