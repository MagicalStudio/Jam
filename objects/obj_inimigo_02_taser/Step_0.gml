 var player = instance_place(x,y,obj_player)

if (player)
{
	player.hp -= dano;
	player.estado = "knockback";
	player.xscale = sign(x-obj_player.x);
}

instance_destroy();