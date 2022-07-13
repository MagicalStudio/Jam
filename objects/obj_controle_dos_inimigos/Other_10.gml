inimigos01_array = inimigos_01_na_view()
randomize();
if (inimigos01_array!=false)
{
	var inimigo_number = irandom(array_length(inimigos01_array)-1);
	inimigo_number = clamp(inimigo_number,0,array_length(inimigos01_array));
	var inimigo_escolhido = inimigos01_array[inimigo_number];
	inimigo_escolhido.escolhido_para_atacar = true;
}