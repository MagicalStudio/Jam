///@func instance_inside_view_camera()
///@arg camera
function instance_inside_view_camera(){
	
	var cam    = argument0;
		
	var cam_width = camera_get_view_width(cam);
	var cam_x = camera_get_view_x(cam);
		
	var cam_height = camera_get_view_height(cam);
	var cam_y = camera_get_view_y(cam);
			
	if (point_in_rectangle(x,y,cam_x,cam_y,cam_x+cam_width,cam_y+cam_height))
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
 