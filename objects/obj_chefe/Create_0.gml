//movimentação
velh = 0;
velv = 0;
spd  = 1;

//estados
estado = "dialogo";
conversei = false;
ataque = "0";
subir = true;

//saude
hp_max = 32;
hp = hp_max;
quantidade_de_golpes_tomados = 0;

//ataques
dano = 3;
  
//pulo
caindo = false;
timer_cair = room_speed;

//draw
xscale = 1;
yscale = 1;
z_pos_add = 0;
z_pos = 0;
brilho = 0;
potencia_do_brilho = 0;
potencia_do_brilho_add = .025;