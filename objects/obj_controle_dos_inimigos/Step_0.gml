if (room==rm_sala_do_boss) or (room==rm_sala_do_boss_restart)
{
	if (alarm[0]==-1)
	{
		if (!instance_exists(obj_inimigo_pai)) && (obj_chefe.estado!="dialogo")
		{
			alarm[0]=room_speed*7;
		}
	}
}

if (alarm[1]==-1) && (quantidade_inimigos_atacando)
{
	alarm[1] = room_speed * 2;
}