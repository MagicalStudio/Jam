/// @description Insert description here
// You can write your code in this editor

f*=.9;


var angle = irandom_range(-f,f);
var x_cam = camera_get_view_x(view_camera[0]);
var y_cam = camera_get_view_y(view_camera[0]);

camera_set_view_angle(view_camera[0],angle);
/*
x=obj_camera.x
y=obj_camera.y;

show_debug_message(f)