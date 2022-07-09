var player = instance_place(x,y,obj_player)

if (player)
{
	player.hp -= dano;
	player.estado = "recebendo_dano";
}

instance_destroy();