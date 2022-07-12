

var golpeado = instance_place(x,y,obj_player_golpe);
var golpeado_por_inimigo = instance_place(x,y,obj_inimigo_pai)

if (!destruido)
{
	if (golpeado_por_inimigo)
	{
		if (golpeado_por_inimigo.estado == "knockback") && (golpeado_por_inimigo.id != ultimo_golpe_inimigo)
		{
			audio_play_sound(snd_soco,1,false)
			hp -= hp;
		 	alarm[2] = 30;
			global.score+=500;
			criar_pop_up("+500",x,y-sprite_height/2);
		}
	}
	if (golpeado.id!=ultimo_golpe)
	{		
		if (golpeado.x > x)
		{
			instance_create_depth(bbox_right,y,-300,obj_impacto);
		}else{
			instance_create_depth(bbox_left,y,-300,obj_impacto);
		}
		audio_play_sound(snd_soco,1,false)
		hp-=golpeado.dano;
		alarm[2] = 30;
		global.score+=golpeado.pontos;
		criar_pop_up("+"+string(golpeado.pontos),x,y-sprite_height/2);
		ultimo_golpe=golpeado.id;
	}
}

if (hp<=0) && (!destruido)
{
	destruido = true;
	spd = 3;
	velh = spd * sign(x-obj_player.x);
	velv = -spd;
	image_alpha = .5;
	instance_create_depth(x,y,depth,obj_cafe,{y_destino : bbox_bottom-10});
				
	repeat(6)
	{
		var xx = irandom_range(bbox_left,bbox_right);
		var yy = irandom_range(y,bbox_top);
		
		instance_create_depth(xx,yy,depth,obj_explosao);
	}
}

if (destruido)
{
	x+=velh*.5;
	y+=velv;
	velv+=.25;
	if (y >=ystart)
	{
		y=ystart;
	}
	if (x != clamp(x,xstart-40, xstart+40))
	{
		x=xstart+40*sign(velh);
	}
}

//if (x-sprite_width*2 < global.min_x) instance_destroy(id,false);