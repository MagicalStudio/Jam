alvo = obj_player;
cam = view_camera[0];

width = camera_get_view_width(cam);

camera_set_view_target(cam,id);
camera_set_view_border(cam,width/2,0);

x_add = 0;

x = obj_player.x;

global.min_x = camera_get_view_x(cam);