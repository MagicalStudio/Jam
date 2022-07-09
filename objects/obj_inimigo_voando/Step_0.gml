spd = 3;

x+=spd*image_xscale*-1;
y-=spd;

image_angle += 10;

if (y<-32) instance_destroy();