//colisao e movimento
if (!global.especial_ativo)
{
	
	if (estado == "atacar") && (ataque == "chifre") && (place_meeting(x+velh,y,obj_chefe_parar_de_correr))
	{
		estado = "parado";
	}
	
	if (estado == "atacar") && (ataque == "chifre") && (place_meeting(x,y+velv,obj_chefe_parar_de_correr))
	{
		estado = "parado";
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
	
	if (x!=clamp(x,0,room_width)) or (y!=clamp(y,0, room_height))
	{
		if (estado!="caido") && (estado!="knockback") && (estado!="levantando")
		{
			x=lerp(x,room_width/2,.1);
			y=lerp(y,room_height/2,.1);
		}
	}
}

depth=-bbox_bottom;