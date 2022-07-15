///@func instance_inside_view_camera()
///@arg camera
function instance_inside_view_camera(){
	
	var cam    = argument0;
		
	var cam_width = camera_get_view_width(cam);
	var cam_x = camera_get_view_x(cam);
		
	var cam_height = camera_get_view_height(cam);
	var cam_y = camera_get_view_y(cam);
			
	if (point_in_rectangle(x,y,cam_x,cam_y,cam_x+cam_width,cam_y+cam_height-sprite_height/3))
	{
		return true;
	}
	return false;	
}

///@func enemy_is_inside_view_camera()
///@arg camera
function enemy_is_inside_view_camera(){
	
	var cam    = argument0;
	var object = instance_nearest(x,y,obj_inimigo_pai);
		
	var cam_width = camera_get_view_width(cam);
	var cam_x = camera_get_view_x(cam);
		
	var cam_height = camera_get_view_height(cam);
	var cam_y = camera_get_view_y(cam);
			
	if (point_in_rectangle(object.x,object.y,cam_x,cam_y,cam_x+cam_width,cam_y+cam_height))
	{
		return true;
	}
	
	return false;
	
}

///@func criar_pop_up()
///@arg text
///@arg x
///@arg y
function criar_pop_up()
{
	instance_create_depth(argument1,argument2,-1000,obj_pop_up,{text : argument0});
}
 
///@func ativar_especial()
function ativar_especial()
{
	if (energia>=3)
	{
		energia-=3;
		global.especial_ativo = true;
		estado = "especial";
	}
}

///@func inimigos_01_na_view()
function inimigos_01_na_view(){
	
	var inimigos = [];	
	
	var qnt_inimigos = instance_number(obj_inimigo_01)
	for (var i = 0; i < qnt_inimigos; i++)
	{
		var inimigo = instance_find(obj_inimigo_01,i);
		if (inimigo.escolhido_para_atacar = false)
		{
			if (inimigo.estado == "atacando")
			{	
				inimigos[array_length(inimigos)] = inimigo.id;
			}
		}else{
			return false
		}
	}
	
	return inimigos;
	
}

///@func inimigos_02_na_view()
function inimigos_02_na_view(){
	
	var inimigos = [];	
	
	var qnt_inimigos = instance_number(obj_inimigo_02)
	for (var i = 0; i < qnt_inimigos; i++)
	{
		var inimigo = instance_find(obj_inimigo_02,i);
		if (inimigo.escolhido_para_atacar = false)
		{
			if (inimigo.estado == "atacando")
			{	
				inimigos[array_length(inimigos)] = inimigo.id;
			}
		}else{
			return false
		}
	}
	
	return inimigos;
	
}
 
///@func transicao()
///@arg proximaRoom
function transicao()
{
	instance_create_depth(0,0,-3000,obj_transicao,{proxima_room : argument0});
}