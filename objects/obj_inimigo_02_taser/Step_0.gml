if (!global.especial_ativo)
{
	var player = instance_place(x,y,obj_player)

	if (player)
	{
		if (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando") && (player.estado!="especial")
		{
			player.hp -= dano;
			player.estado = "knockback";
			player.xscale = sign(x-obj_player.x);
		}
	}
}

instance_destroy();