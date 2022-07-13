inimigos02_array = inimigos_02_na_view()
randomize();
if (inimigos02_array!=false)
{
	var inimigo_number = irandom(array_length(inimigos02_array)-1);
	inimigo_number = clamp(inimigo_number,0,array_length(inimigos02_array));
	var inimigo_escolhido = inimigos02_array[inimigo_number];
	inimigo_escolhido.escolhido_para_atacar = true;
}