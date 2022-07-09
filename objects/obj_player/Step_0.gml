//input
var left,down,up,right
left = keyboard_check(vk_left);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);

velv = (down - up) * vel;
velh = (right - left) * vel;	
//state machine
switch(estado)
{
	case "parado":
		if (velv or velh) estado = "andando";
	break;
	
	case "andando":
		if (!velv && !velh) estado = "parado";		
	break;
}

sprite_index = asset_get_index("spr_player_"+string(estado));
if (velh!=0)
{
	xscale = sign(velh);
}