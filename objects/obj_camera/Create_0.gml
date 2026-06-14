//Configurar camera
cam = view_camera[0];
follow = obj_player;
view_half_width = camera_get_view_width(cam) * 0.5;
view_half_height = camera_get_view_height(cam) * 0.5;
x_to = xstart;
y_to = ystart;

//Screenshake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;  