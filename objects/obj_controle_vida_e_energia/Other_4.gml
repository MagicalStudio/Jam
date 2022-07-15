if (room == rm_sala_do_boss)
{
	if (status=[0,0])
	{
		status[0] = player.hp;
		status[1] = player.energia;
	}

}

if (room == rm_sala_do_boss_restart)
{
	obj_player.hp = status[0];
	obj_player.energia = status[1];
}

if (room == rm_menu)
{
	status=[0,0];
}