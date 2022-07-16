inimigos_array = inimigos_escolhidos_para_atacar()
if (inimigos_array!=false) && (quantidade_inimigos_atacando<2)
{	
	if (quantidade_inimigos_atacando<2)
	{
		do
		{
			inimigo_number    = irandom(array_length(inimigos_array)-1);
			inimigo_number	  = clamp(inimigo_number,0,array_length(inimigos_array));
			inimigo_escolhido = inimigos_array[inimigo_number];
		}until inimigo_escolhido!=-1 && inimigo_escolhido.escolhido_para_atacar == false;
		
		quantidade_inimigos_atacando++;
		inimigos_array[inimigo_number] = -1;
		
		if (quantidade_inimigos_atacando==1)
		{
			inimigo_escolhido.x_atacar = sign(inimigo_escolhido.x-obj_player.x) * 15;
		}else{
			for (var i = 0; i < instance_number(obj_inimigo_pai); i++)
			{
				var inimigo = instance_find(obj_inimigo_pai,i);
				if (inimigo.escolhido_para_atacar)
				{
					inimigo_escolhido.x_atacar = inimigo.x_atacar*-1;
					break;
				}
			}
		}
		inimigo_escolhido.escolhido_para_atacar = true;
	}
}
