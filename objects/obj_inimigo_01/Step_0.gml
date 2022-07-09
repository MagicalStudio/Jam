event_inherited();

var distancia_horizontal = abs(obj_player.x-x);
var distancia_vertical   = abs(obj_player.y-y);

//state machine
switch(estado)
{
	case "parado":
		if (instance_inside_view_camera(view_camera[0]))
		{
			if (alarm[0] == -1) alarm[0] = 20;
		}
	break;
	
	case "andando":
		if (distancia_horizontal >= 24)
		{
			var lado = sign(obj_player.x-x);
			xscale = lado;
			velh = lado * vel
			x+=velh;
		}else{
			if (distancia_vertical>1)
			{
				var lado = sign(obj_player.y-y);
				velv = lado * vel
				y+=velv;
			}else{
				estado = "atacando";
			}
		}
			
	break;
	
	case "atacando":
		if (distancia_horizontal >= 24) or (distancia_vertical>1)
		{
			estado = "andando";
		}else{
			if (alarm[1] == -1)
			{
				alarm[1] = room_speed*2;
			}
		}
	break;
	
	case "recebendo_dano":
		if (alarm[2] == -1) 
		{
			alarm[2] = 20;
		}
	break;
}
