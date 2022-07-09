x = lerp(x,alvo.x,.1);
global.min_x = camera_get_view_x(cam);
x = clamp(x,global.min_x + width/2, room_width);