if (room == rm_sala_do_boss)
{
	estado = "cutscene";
	xscale = 1;
	status_manter = [hp,energia];	
	x=32;
	y=96;
}

if (room == rm_sala_do_boss_restart)
{
	
	estado = "parado";
	xscale = 1;
	
	hp = status_manter[0];
	energia = status_manter[1];
	
	x=32;
	y=96;
}

if (room == rm_corredor)
{
	x = 64;
	y = 96;
	
	hp = hp_max;
	energia = 0;
	
	global.min_x = 0;
}

if (room == rm_menu) instance_destroy();