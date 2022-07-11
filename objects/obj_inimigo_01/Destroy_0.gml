if (global.inimigo01_avancando==id) global.inimigo01_avancando = false;
instance_create_depth(x,y,depth,obj_inimigo_morto,{sprite_index : sprite_index, velh : velh, xscale : xscale});

