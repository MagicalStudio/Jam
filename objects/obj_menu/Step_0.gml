if (keyboard_check_pressed(vk_space))
{
	if (room == rm_menu) transicao(rm_corredor);
}

if (keyboard_check_pressed(vk_escape))
{
	if (room == rm_menu) transicao(rm_creditos);
	else transicao(rm_menu);
}