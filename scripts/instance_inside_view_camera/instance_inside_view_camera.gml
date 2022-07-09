///@func instance_inside_view_camera()
///@arg camera
///@arg object
function instance_outside_view_camera(){
	
	var cam    = argument0;
	var obj	   = argument1;
		
	if (instance_exists(obj))
	{
		var cam_width = camera_get_view_width(cam);
		var cam_x = camera_get_view_x(cam);
		
		var cam_height = camera_get_view_height(cam);
		var cam_y = camera_get_view_y(cam);
		
		for (var i = 0; i < instance_number(obj); i++)
		{
			var check_pos = instance_find(obj,i);
			
			if (point_in_rectangle(check_pos.x,check_pos.y,cam_x,cam_y,cam_x+cam_width,cam_y+cam_height))
			{
				
			}
			
		}
	}	
}
