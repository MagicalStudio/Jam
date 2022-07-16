if (room == rm_sala_do_boss)
{
	x = 32;
	y = 96;
	
	
	obj_controle_vida_e_energia.status[0] = hp;
	obj_controle_vida_e_energia.status[1] = energia;
	
}


if (room == rm_sala_do_boss_restart)
{
	energia = obj_controle_vida_e_energia.status[1];
	hp = obj_controle_vida_e_energia.status[0];
}