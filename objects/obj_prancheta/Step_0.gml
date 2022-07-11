if (!cheguei)
{
	if (ir_embora == false)
	{
		x = lerp(x,x_destino,.1)
		y=obj_player.y+obj_player.z_pos
		if (alarm[0]==-1)
		{
			alarm[0]=room_speed;
		}
	}
}else{
	if (global.especial_ativo)
	{
		if (ir_embora == false) len=lerp(len,30,.1);
	}else{
		ir_embora = true;
	}
	
	if (ir_embora)
	{
		len++;
		if (len > 150)
		{
			instance_destroy();
		}
	}
	
	angle_add_add=lerp(angle_add_add,angle_add,.1);
	angle+=angle_add_add * 10;
	x=x_destino+lengthdir_x(len,angle);
	y=obj_player.y+obj_player.z_pos+lengthdir_y(len,angle);
	image_angle = angle;
}