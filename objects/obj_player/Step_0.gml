//input
var left,down,up,right,soco
left = keyboard_check(vk_left) or (keyboard_check(ord("A")));
down = keyboard_check(vk_down) or (keyboard_check(ord("S")));
right = keyboard_check(vk_right) or (keyboard_check(ord("D")));
up = keyboard_check(vk_up) or (keyboard_check(ord("W")));
soco = keyboard_check(ord("C"));
//state machine
switch(estado)
{
	#region parado
	case "parado":
		tempo_combo = tempo_padrao;
		combo_fase = 0;
		velv = (down - up) * vel;
		velh = (right - left) * vel;	
		if (velv or velh) estado = "andando";
		if (soco) estado = "socando";
		sprite_index = asset_get_index("spr_player_"+string(estado));
	break;
	#endregion
	
	#region andando
	case "andando":
		combo_fase = 0;
		tempo_combo = tempo_padrao;
		velv = (down - up) * vel;
		velh = (right - left) * vel;	
		if (!velv && !velh) estado = "parado";		
		if (soco) estado = "socando";
		sprite_index = asset_get_index("spr_player_"+string(estado));
	break;
	#endregion
	
	#region socando
	case "socando":
		if (alarm[0]==-1) tempo_combo--;
		if (tempo_combo <=0) estado = "parado";
		var tempo_ataque = 20;
				
		velh = 0;	
		velv = 0;
		if (soco)
		{
			if (alarm[0] == -1)
			{
				show_debug_message(combo_fase)
				if (combo_fase == 2) // gancho
				{
					instance_create_depth(x,y,depth,obj_player_gancho,{image_xscale : xscale, dano : 2, pontos : 200})
					combo_fase = 0; // volto pro soco
					alarm[0] = tempo_ataque*2
				}else if (combo_fase == 1) // chute
				{
					instance_create_depth(x,y,depth,obj_player_chute,{image_xscale : xscale, dano : 1, pontos : 100})
					combo_fase=2; // vou pro gancho
					alarm[0] = tempo_ataque;
				}else if (combo_fase == 0) //soco
				{
					instance_create_depth(x,y,depth,obj_player_soco,{image_xscale : xscale, dano : 1, pontos : 50})
					combo_fase=1; // vou pro chute
					alarm[0] = tempo_ataque
				}
			}
		}
	break;
	#endregion
	
	#region recebendo_dano	
	case "recebendo_dano":
		combo_fase = 0;
		tempo_combo=tempo_padrao;
		if (alarm[2] == -1) 
		{
			alarm[2] = 10;
		}
	break;
	#endregion
	
	#region knockback
	
	case "knockback":
	
		z_pos+=z_pos_add;
		if (z_pos>-16) && (subir)
		{ 
			z_pos_add-=.25;
		}else{
			subir = false;
			z_pos_add+=.25;
			if (z_pos>=0)
			{
				subir = true;
				estado = "caido";
				z_pos = 0;
				z_pos_add = -2;
			}
		}
		image_angle+=2.2 * xscale;
		velh = xscale*2*-1;
		velv = 0;
	
	break;
	
	#endregion
	
	#region caido
	case "caido":
		velv = 0;
		velh = 0;
		if (alarm[3]==-1) alarm[3] = room_speed;
	break;
	#endregion
	
	#region levantando
	case "levantando":
		//velv=-1;
		image_angle = lerp(image_angle,0,.1);
		if (round(image_angle)==0) estado = "parado";
	break;
	#endregion
}

if (velh!=0) && (estado!="knockback") && (estado!="caido") && (estado!="levantando")
{
	xscale = sign(velh);
}