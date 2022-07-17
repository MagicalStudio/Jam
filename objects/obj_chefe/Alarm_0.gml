///@desc escolher ataque
if (estado!= "fragilizado") && (estado!= "morto") && (estado!="knockback") && (estado != "levantando") && (estado != "caido")
{
	if (ataque != "0")
	{
		estado = "atacando";
		ataque = choose("impressora","chifre","pulo");

		if (ataque == "impressora") && (instance_exists(obj_impressora_boss_fight))
		{
			ataque = choose("chifre","pulo");
		}
		
		if (ataque == "pulo")
		{
			alarm[2] = room_speed *2;
			sprite_index = spr_chefe_forte_preparando_pulo;
		}
		
		if (ataque == "chifre")
		{
			sprite_index = spr_chefe_forte_correndo;
			image_index = 0;
			image_speed = 0;
		}
		
		if (ataque == "impressora")
		{
			sprite_index = spr_chefe_forte_genki_dama;
		}
		
	}else{
		estado = "atacando";
		ataque = "impressora";
		sprite_index = spr_chefe_forte_genki_dama;
	}
}