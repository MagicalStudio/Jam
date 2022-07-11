

var golpeado = instance_place(x,y,obj_player_golpe);
var golpeado_por_inimigo = instance_place(x,y,obj_inimigo_pai)

if (golpeado) && (!destruido) or (golpeado_por_inimigo)
{
	if (golpeado_por_inimigo)
	{
		if (golpeado_por_inimigo.estado == "knockback") && (golpeado_por_inimigo.id != ultimo_golpe_inimigo)
		{
			ultimo_golpe_inimigo = golpeado_por_inimigo.id;
			hp -= hp;
			if (hp<=0)
			{
				spd = 3;
				velh = spd * sign(x-obj_player.x);
				velv = -spd;
				image_alpha = .5;
				instance_create_depth(x,y,depth,obj_cafe,{y_destino : bbox_bottom-10});
			}
			
			repeat(6)
			{
				var xx = irandom_range(bbox_left,bbox_right);
				var yy = irandom_range(y,bbox_top);
					
				instance_create_depth(xx,yy,depth,obj_explosao);
			}
			
			alarm[2] = 30;
		
			global.score+=500;
			criar_pop_up("+500",x,y-sprite_height);
		}
	}else{
		if (golpeado.id!=ultimo_golpe)
		{
			hp -= golpeado.dano;
			if (hp<=0)
			{
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
				
			alarm[2] = 30;
		
			global.score+=golpeado.pontos;
			criar_pop_up("+"+string(golpeado.pontos),x,y-sprite_height);
			
			ultimo_golpe=golpeado.id;
		}
	}
	
}
x+=velh;
y+=velv;
image_angle += spd*1.5;

if (y<-sprite_height) instance_destroy();