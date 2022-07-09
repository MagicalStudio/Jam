//input
var left,down,up,right,soco
left = keyboard_check(vk_left);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
soco = keyboard_check_pressed(ord("C"));

velv = (down - up) * vel;
velh = (right - left) * vel;	
//state machine
switch(estado)
{
	case "parado":
		if (velv or velh) estado = "andando";
		if (soco) estado = "socando";
	break;
	
	case "andando":
		if (!velv && !velh) estado = "parado";		
		if (soco) estado = "socando";
	break;
	
	case "socando":
		velh = 0;	
		velv = 0;
		if (alarm[0] == -1)
		{
			alarm[0] = 20;
			instance_create_depth(x,y,depth,obj_player_soco,{image_xscale : xscale})
		}
	break;
	
	
	
}

sprite_index = asset_get_index("spr_player_"+string(estado));
if (velh!=0)
{
	xscale = sign(velh);
}