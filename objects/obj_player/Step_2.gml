// movimento e colisao

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


x = clamp(x,global.min_x+sprite_width/2,room_width-sprite_width/2);
y = clamp(y,sprite_height/2,room_height-sprite_height/2);

//configurando a movimentação da camera


