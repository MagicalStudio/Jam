randomize();
// movimento
vel = 1.5;
velh = 0;
velv = 0;

//draw
xscale = 1;
yscale = 1;
z_pos = 0;
z_pos_add = -2;
subir = true;

//ataques
combo_fase = 0;
tempo_padrao = 10;
tempo_combo = tempo_padrao;


// state machine
estado = "parado";

//saude
hp_max = 100;
energia = 0;
hp = hp_max;
