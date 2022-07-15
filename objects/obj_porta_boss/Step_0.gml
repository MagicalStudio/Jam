colisao_player = collision_rectangle(x+10,y,x+20,y+50,obj_player,true,true);

if (colisao_player)
{
	if (keyboard_check_released(ord("C")))
	{
		transicao(rm_sala_do_boss);
	}
}