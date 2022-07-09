//receben do dano
var caixa_de_colisao = collision_rectangle(x-10,bbox_top,x+10,y,obj_player_golpe,true,true);

if (caixa_de_colisao) && (estado!="caido") && (estado!="levantando")
{
	if (caixa_de_colisao.id!=ultimo_soco)
	{
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