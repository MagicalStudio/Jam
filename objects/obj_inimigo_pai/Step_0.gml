//recebendo dano
var caixa_de_colisao = collision_rectangle(x-10,bbox_top,x+10,y,obj_player_soco,true,true);

if (caixa_de_colisao)
{
	if (caixa_de_colisao.id!=ultimo_soco)
	{
		if (hp-- < 0) instance_destroy();
		hp -= 1;		
		ultimo_soco=caixa_de_colisao.id;
		audio_play_sound(snd_soco,1,false)
		estado = "recebendo_dano";		
	}
}