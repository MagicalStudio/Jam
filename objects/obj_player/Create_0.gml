randomize();
// movimento
vel = 1.5;
velh = 0;
velv = 0;

//draw
xscale = 1;
yscale = 1;

//ataques
combo_fase = 0;
tempo_padrao = 10;
tempo_combo = tempo_padrao;
energia = 0;

// state machine
estado = "parado";

//saude
hp_max = 10;
hp = hp_max;