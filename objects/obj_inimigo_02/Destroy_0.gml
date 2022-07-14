if (escolhido_para_atacar)
{
	escolhido_para_atacar = false;
	obj_controle_dos_inimigos.inimigos02_array = false;
}
instance_create_depth(x,y,depth,obj_inimigo_morto,{sprite_index : sprite_index, velh : velh, xscale : xscale});