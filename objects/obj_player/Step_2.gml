// movimento e colisao

if (global.especial_ativo==false)
{
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

		if (place_meeting(x,y+velv,obj_colisao))
		{
			while(!place_meeting(x,y+sign(velv),obj_colisao))
			{
				y+=sign(velv);
			}
			velv = 0;
		}
	}
	x+=velh;
	y+=velv;
}

depth = -bbox_bottom;

//mexendo na camera
cam = view_camera[0];
width = camera_get_view_width(cam);


global.min_x = camera_get_view_x(cam);

x = clamp(x,global.min_x+sprite_width/2,room_width-sprite_width/2);
y = clamp(y,sprite_height/2,room_height-sprite_height/2);


obj_camera.x = x;

obj_camera.x = clamp(obj_camera.x,global.min_x+width/2, room_width);
