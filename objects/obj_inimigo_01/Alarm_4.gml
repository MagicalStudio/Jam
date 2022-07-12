///@desc voltar
estado = "voltar";
direcao_voltar = point_direction(obj_player.x,obj_player.y,x,y)+irandom_range(-variancia,variancia);
var x_ = x+lengthdir_x(distancia_voltar,direcao_voltar);
var y_ = y+lengthdir_y(distancia_voltar,direcao_voltar);
x_y_voltar=[x_,y_];