event_inherited();

var distancia_horizontal = abs(obj_player.x-x);
var distancia_vertical   = abs(obj_player.y-y);

//state machine
switch(estado)
{
	case "parado":
		if (instance_inside_view_camera(view_camera[0]))
		{
			if (alarm[0] == -1) alarm[0] = 10;
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
			}
		}
		
	break;
	
	case "recebendo_dano":
	break;
}
