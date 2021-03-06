var caixa_de_colisao = collision_rectangle(x-10,bbox_top,x+10,y,obj_player_golpe,true,true);
if (caixa_de_colisao) && (estado!="caido") && (estado!="levantando") && (estado!="knockback") // tomando dano
{
	if (caixa_de_colisao.id!=ultimo_soco)
	{
		criar_pop_up("+"+string(caixa_de_colisao.pontos),x,y-sprite_height);
		instance_create_depth(x+sprite_width/2*xscale,y,depth,obj_impacto)
		global.score+=caixa_de_colisao.pontos;
		if (!audio_is_playing(snd_inimigo_dano))
		{
			audio_play_sound(snd_inimigo_dano,1,0);
		}
		if (hp-caixa_de_colisao.dano < 0)
		{
			if (caixa_de_colisao.object_index==obj_player_gancho)
			{
				instance_create_depth(x,y,-100,obj_inimigo_voando,{image_xscale:xscale, sprite_index : sprite_index})
				instance_destroy(id,false);
			}else{
				instance_destroy();
			}
		}
		hp -= caixa_de_colisao.dano;
		ultimo_soco=caixa_de_colisao.id;
		
		if (!audio_is_playing(snd_soco))
		{
			audio_play_sound(snd_soco,1,false);
		}
			
		if (caixa_de_colisao.object_index == obj_player_gancho)
		{
			estado = "knockback";
			obj_player.energia+=1;
			if (obj_player.energia >=3) obj_player.energia = 3;
		}else{
			estado = "recebendo_dano";
		}
	}
}

depth = -bbox_bottom
if (instance_place(x,y,obj_colisao))
{
	while(instance_place(x,y,obj_colisao))
	{
		y++;
	}
}

if (!global.especial_ativo) // colisao
{
	if (place_meeting(x+velh,y,obj_colisao))
	{
		if (estado=="voltar") estado = "andando";
		while(!place_meeting(x+sign(velh),y,obj_colisao))
		{
			x+=sign(velh);
		}
		velh = 0;
	}

	x+=velh;

	if (place_meeting(x,y+velv,obj_colisao))
	{
		if (estado=="voltar") estado = "andando";
		while(!place_meeting(x,y+sign(velv),obj_colisao))
		{
			y+=sign(velv);
		}
		velv = 0;
	}

	y+=velv;

}