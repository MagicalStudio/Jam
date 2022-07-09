//input
var left,down,up,right,soco
left = keyboard_check(vk_left);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
soco = keyboard_check(ord("C"));
//state machine
switch(estado)
{
	case "parado":
		tempo_combo = tempo_padrao;
		combo_fase = 0;
		velv = (down - up) * vel;
		velh = (right - left) * vel;	
		if (velv or velh) estado = "andando";
		if (soco) estado = "socando";
		sprite_index = asset_get_index("spr_player_"+string(estado));
	break;
	
	case "andando":
		combo_fase = 0;
		tempo_combo = tempo_padrao;
		velv = (down - up) * vel;
		velh = (right - left) * vel;	
		if (!velv && !velh) estado = "parado";		
		if (soco) estado = "socando";
		sprite_index = asset_get_index("spr_player_"+string(estado));
	break;
	
	case "socando":
		if (alarm[0]==-1) tempo_combo--;
		if (tempo_combo <=0) estado = "parado";
		var tempo_ataque = 30;
				
		velh = 0;	
		velv = 0;
		if (soco)
		{
			if (alarm[0] == -1)
			{
				show_debug_message(combo_fase)
				if (combo_fase == 2) // gancho
				{
					instance_create_depth(x,y,depth,obj_player_gancho,{image_xscale : xscale, dano : 2})
					combo_fase = 0; // volto pro soco
					alarm[0] = tempo_ataque*2
				}else if (combo_fase == 1) // chute
				{
					instance_create_depth(x,y,depth,obj_player_chute,{image_xscale : xscale, dano : 1})
					combo_fase=2; // vou pro gancho
					alarm[0] = tempo_ataque;
				}else if (combo_fase == 0) //soco
				{
					instance_create_depth(x,y,depth,obj_player_soco,{image_xscale : xscale, dano : 1})
					combo_fase=1; // vou pro chute
					alarm[0] = tempo_ataque
				}
			}
		}
	break;
	
	case "recebendo_dano":
		combo_fase = 0;
		tempo_combo=tempo_padrao;
		if (alarm[2] == -1) 
		{
			alarm[2] = 10;
		}
	break;
}
if (velh!=0)
{
	xscale = sign(velh);
}