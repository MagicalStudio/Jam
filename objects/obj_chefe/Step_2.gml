//colisao e movimento
if (!global.especial_ativo)
{
	if (place_meeting(x,y,obj_colisao))
	{
		while(place_meeting(x,y,obj_colisao))
		{
			y++;
		}
	}
	if (estado!="knockback")
	{
		if (place_meeting(x+velh,y,obj_colisao))
		{		
			while(!place_meeting(x+sign(velh),y,obj_colisao))
			{
				x+=sign(velh);
			}
			velh = 0;
		}
	}

	x+=velh;

	if (place_meeting(x,y+velv,obj_colisao))
	{
		while(!place_meeting(x,y+sign(velv),obj_colisao))
		{
			y+=sign(velv);
		}
		velv = 0;
	}

	y+=velv;
 	
	if (x!=clamp(x,sprite_width/2,room_width-sprite_width/2)) or (y!=clamp(y,sprite_height/2, room_height-sprite_height/2))
	{
		if (estado!="caido") && (estado!="knockback") && (estado!="levantando") && (estado!="dialogo") && (estado!="transformando") && (estado!="engolindo")
		{
			x=lerp(x,room_width/2,.1);
			y=lerp(y,room_height/2,.1);
			
			if (estado == "atacar") && (ataque == "chifre")
			{
				estado = "parado";
			}
	
		}
		
	}
	
}

depth=-bbox_bottom;