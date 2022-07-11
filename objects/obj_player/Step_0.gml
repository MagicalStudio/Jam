//input
var left,down,up,right,soco,especial
left = keyboard_check(vk_left) or (keyboard_check(ord("A")));
down = keyboard_check(vk_down) or (keyboard_check(ord("S")));
right = keyboard_check(vk_right) or (keyboard_check(ord("D")));
up = keyboard_check(vk_up) or (keyboard_check(ord("W")));
soco = keyboard_check(ord("C"));
especial = keyboard_check(vk_space);
	
//state machine
switch(estado)
{
	#region parado
	case "parado":
		velv = (down - up) * vel;
		velh = (right - left) * vel;
		tempo_combo = tempo_padrao;
		combo_fase = 0;
		z_pos = lerp(z_pos,0,.1);
		if (velv!=0 or velh!=0) estado = "andando";
		if (soco) estado = "socando";
		if (especial) ativar_especial();
		sprite_index = spr_player_parado;
	break;
	#endregion
	
	#region andando
	case "andando":
		if (velv!=0 or velh!=0)
		{
			combo_fase = 0;
			tempo_combo = tempo_padrao;
			z_pos = lerp(z_pos,0,.1);
			velv = (down - up) * vel;
			velh = (right - left) * vel;
			//movimento 	
			if (soco) estado = "socando";
			sprite_index = spr_player_andando;
			if (especial) ativar_especial();
		}else{
			estado = "parado";
		}
	break;
	#endregion
	
	#region socando
	case "socando":
		z_pos = lerp(z_pos,0,.1);
		if (alarm[0]==-1) tempo_combo--;
		if (tempo_combo <=0) estado = "parado";
		var tempo_ataque = 20;
				
		velh = 0;	
		velv = 0;
		if (soco)
		{
			if (alarm[0] == -1)
			{
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
		z_pos = lerp(z_pos,0,.1);
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
		z_pos = lerp(z_pos,0,.1);
		velv = 0;
		velh = 0;
		if (alarm[3]==-1) alarm[3] = room_speed;
	break;
	#endregion
	
	#region levantando
	case "levantando":
		z_pos = lerp(z_pos,0,.1);
		//velv=-1;
		image_angle = lerp(image_angle,0,.1);
		if (round(image_angle)==0) estado = "parado";
	break;
	#endregion
	
	#region especial
	case "especial":
		z_pos = lerp(z_pos,-15,.1);
		if (alarm[1]==-1)
		{
			audio_play_sound(snd_especial,2,0)
			alarm[1] = room_speed * 3;
		}
	break;
	#endregion
}

if (velh!=0) && (estado!="knockback") && (estado!="caido") && (estado!="levantando")
{
	xscale = sign(velh);
}