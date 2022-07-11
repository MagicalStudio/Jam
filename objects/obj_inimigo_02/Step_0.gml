event_inherited();

//state machine
sprite_index = asset_get_index("spr_inimigo_01_parado_"+string(skin))

switch(estado)
{
	#region parado
	case "parado":
		velv = 0;
		velh = 0;
		if (instance_inside_view_camera(view_camera[0]))
		{
			if (alarm[0] == -1) alarm[0] = 20;
		}
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
	break;
	#endregion
	
	#region andando
	case "andando":
		image_angle = 0;
		var dir = point_direction(x,y,obj_player.x,obj_player.y);
		velh = lengthdir_x(vel,dir);
		velv = lengthdir_y(vel,dir);
		
		if (obj_player.x>x) xscale = 1;
		else xscale=-1;
			
		if (distance_to_point(obj_player.x,obj_player.y) <= 60)
		{
			estado = "atacando";
		}		
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
		
	break;
	#endregion
	
	#region atacando
	case "atacando":		
		velv = 0;
		velh = 0;
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
		if (distance_to_point(obj_player.x,obj_player.y) >= 60)
		{
			estado = "andando";
		}else{
			 if (timer_para_avancar>0)
			 {
				 timer_para_avancar--
			 }else{
				 if (global.inimigo02_avancando == false)
				 {
					 timer_para_avancar = 40;
					 global.inimigo02_avancando = id;
					 ataque = choose ("taser","porrada");
					 x_y_voltar=[x,y];
					 estado = "atacar";
				 }
			 }
		}
		
		if (obj_player.x>x) xscale = 1;
		else xscale=-1;
		
	break;
	#endregion
	
	#region atacar
	case "atacar":
		if (obj_player.x>x) xscale = 1;
		else xscale=-1;
		
		var dir = point_direction(x,y,obj_player.x,obj_player.y);
		velh = lengthdir_x(vel*1.5,dir);
		velv = lengthdir_y(vel*1.5,dir);
		
		if (global.inimigo02_avancando!=id) estado = "andando";
		
		if (distance_to_point(obj_player.x,obj_player.y) <= 20)
		{
			velv = 0;
			velh = 0;
			var distancia_y = abs(obj_player.y-y)
			if (distancia_y > 5)
			{
				y+=sign(obj_player.y-y);
			}else{
				if (alarm[1]==-1) alarm[1] = 30
			}
		}
		if (distance_to_point(obj_player.x,obj_player.y) >= 60)
		{
			estado = "andando";
			if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
		}
		
	break;
	#endregion
	
	#region voltar
	case "voltar":
		var dir = point_direction(x,y,x_y_voltar[0],x_y_voltar[1]);
		velh = lengthdir_x(vel,dir);
		velv = lengthdir_y(vel,dir);
			
		if (obj_player.x>x) xscale = 1;
		else xscale=-1;
			
		if (distance_to_point(x_y_voltar[0],x_y_voltar[1])<.1)
		{
			estado = "andando";
		}
	break;
	#endregion

	#region recebendo_dano
	case "recebendo_dano":
		velv = 0;
		velh = 0;
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
		if (alarm[2] == -1) 
		{
			alarm[2] = 20; 
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
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
	break;
	#endregion
	
	#region caido
	case "caido":
		velv = 0;
		velh = 0;
		if (alarm[3]==-1) alarm[3] = room_speed;
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
	break;
	#endregion
	
	#region levantando
	case "levantando":
		if (global.inimigo02_avancando == id) global.inimigo02_avancando = false;
		//velv=-1;
		image_angle = lerp(image_angle,0,.1);
		if (round(image_angle)==0) estado = "andando";
	break;
	#endregion
}

var caixa_de_colisao = collision_rectangle(x-10,bbox_top,x+10,y,obj_player_golpe,true,true);

if (caixa_de_colisao) && (estado!="caido") && (estado!="levantando") && (estado!="knockback")
{
	if (caixa_de_colisao.id!=ultimo_soco)
	{
		criar_pop_up("+"+string(caixa_de_colisao.pontos),x,y-sprite_height);
		global.score+=caixa_de_colisao.pontos;
		if (hp-caixa_de_colisao.dano < 0)
		{
			instance_destroy();
			if (caixa_de_colisao.object_index==obj_player_gancho)
			{
				instance_create_depth(x,y,-100,obj_inimigo_voando,{image_xscale:xscale, sprite_index : sprite_index})
			}
		}
		hp -= caixa_de_colisao.dano;
		ultimo_soco=caixa_de_colisao.id;
		audio_play_sound(snd_soco,1,false);
		
		if (caixa_de_colisao.object_index == obj_player_gancho)
		{
			estado = "knockback";
		}else{
			estado = "recebendo_dano";
			knockback_force = 10;
		}
	}
}