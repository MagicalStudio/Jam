//recebendo dano
var caixa_de_colisao = collision_rectangle(x-10,bbox_top,x+10,y,obj_player_soco,true,true);

if (caixa_de_colisao)
{
	if (caixa_de_colisao.id!=ultimo_soco)
	{
		if (vida-- < 0) instance_destroy();
		vida -= 1;		
		ultimo_soco=caixa_de_colisao.id;
		estado = "recebendo_dano";
		tempo_brilhando = 1;
	}
}