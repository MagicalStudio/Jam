if (instance_inside_view_camera(view_camera[0]))
{
	hp -= global.especial_dano;
	global.score += global.pontos_especial;
	criar_pop_up("+"+string(global.pontos_especial),x,y-sprite_height);
	xscale *=-1;

	if (hp<=0)
	{
		instance_destroy();
	}

	alarm[2] = 30; 
}