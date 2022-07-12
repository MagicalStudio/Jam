var player = instance_place(x,y,obj_player)

if (player)
{
	if (player.estado!="knockback") && (player.estado!="caido") && (player.estado!="levantando") && (player.estado!="especial")
	{
		player.hp -= dano;
		player.estado = "recebendo_dano";
		instance_create_depth(x,y,depth,obj_impacto);
	}
}

instance_destroy();