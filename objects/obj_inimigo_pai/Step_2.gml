depth = -bbox_bottom

if (place_meeting(x+velh,y,obj_colisao))
{
	while(!place_meeting(x+sign(velh),y,obj_colisao))
	{
		x+=sign(velh);
	}
	velh = 0;
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