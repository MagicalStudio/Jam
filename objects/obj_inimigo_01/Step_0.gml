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
		image_angle = 0;
		if (distancia_horizontal >= 24)
		{
			var lado = sign(obj_player.x-x);
			xscale = lado;
			velh = lado * vel
			x+=velh;
		}else{
			if (distancia_vertical>variancia)
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
		
		if (distancia_horizontal >= 24) or (distancia_vertical>variancia) 
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
	
	case "knockback":
		z_pos+=z_pos_add;
		if (z_pos>-16) && (subir)
		{
			z_pos_add-=.25;
		}else{
			subir = false;
			z_pos_add+=.25;
			if (z_pos>=0)
			{
				subir = true;
				estado = "caido";
				z_pos = 0;
				z_pos_add = -2;
			}
		}
		image_angle+=2.2 * xscale;
		velh = xscale*2*-1;
		x+=velh;
	break;
	
	case "caido":
		if (alarm[3]==-1) alarm[3] = room_speed;
	break;
	
	case "levantando":
		y-=.25;
		image_angle = lerp(image_angle,0,.1);
		if (round(image_angle)==0) estado = "andando";
	break;
}
