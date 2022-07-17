var golpeado = instance_place(x,y,obj_player_golpe);
var golpeado_por_inimigo = instance_place(x,y,obj_inimigo_pai)

if(global.especial_ativo) && (instance_exists(obj_prancheta)) hp = 0;

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
	
	if (golpeado)
	{
		if (golpeado.id!=ultimo_golpe)
		{		
			if (golpeado.x > x)
			{
				instance_create_depth(bbox_right,y,-300,obj_impacto);
			}else{
				instance_create_depth(bbox_left,y,-300,obj_impacto);
			}
			
			if (!audio_is_playing(snd_soco))
			{
				audio_play_sound(snd_soco,1,false);
			}
			
			hp-=golpeado.dano;
			alarm[2] = 30;
			global.score+=golpeado.pontos;
			criar_pop_up("+"+string(golpeado.pontos),x,y-sprite_height/2);
			ultimo_golpe=golpeado.id;
		}
	}
}

if (hp<=0) && (!destruido)
{
	destruido = true;
	instance_create_depth(x,y,0,obj_screen_shake)
	spd = 3;
	velh = spd * sign(x-obj_player.x);
	velv = -spd;
	image_alpha = .5;
	
	if (!audio_is_playing(snd_explosao))
	{
		audio_play_sound(snd_explosao,3,0);
	}
	
	instance_create_depth(x,y,depth,obj_vermelho_explosao)
			
	repeat(6)
	{
		var xx = irandom_range(bbox_left,bbox_right);
		var yy = irandom_range(y,bbox_top);
		
		instance_create_depth(xx,yy,depth,obj_explosao);
	}
	
	var list_ = ds_list_create();
	var ellipse_collision = collision_ellipse_list(x-60,y-10,x+60,y+10,obj_inimigo_pai,true,true,list_,true);
	if (ellipse_collision > 0)
	{
		for (var i = 0; i < ellipse_collision; i++)
		{
			if (list_[| i].escolhido_para_atacar==true)
			{
				obj_controle_dos_inimigos.quantidade_inimigos_atacando--;
			}
			instance_destroy(list_[| i],false);
			instance_create_depth(list_[| i].x,list_[| i].y,depth,obj_inimigo_voando_carbonizado,{image_xscale : sign(x-list_[| i].x), sprite_index : list_[| i].sprite_index });
		}
	}
	ds_list_destroy(list_);
	
	var list_ = ds_list_create();
	var ellipse_collision = collision_ellipse_list(x-60,y-10,x+60,y+10,obj_impressora_colisao,true,true,list_,true);
	if (ellipse_collision > 0)
	{
		for (var i = 0; i < ellipse_collision; i++)
		{
			list_[| i].hp=0;
		}
	}
	ds_list_destroy(list_);
}

x+=velh;
y+=velv;
image_angle += spd*1.5;

if (y<-sprite_height) instance_destroy();