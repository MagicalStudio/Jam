event_inherited();

//movimento
vel = 1+random(.5);
velh = 0;
velv = 0;

//skin
skin = 1+irandom(1);
sprite_index = asset_get_index("spr_inimigo_01_parado_"+string(skin));