event_inherited();

//movimento
vel = 1+random(.5);
velh = 0;
velv = 0;
direcao_andar = 0;
direcao_voltar = 0;
distancia_voltar = 60+irandom_range(-20,20);;
variancia = 80;
aumentar_x = false;

//saude
hp_max = 7;
hp = hp_max;

//atacar
timer_para_avancar = 40;
escolhido_para_atacar = false;
ataque = 0;

//skin 
skin = 1;