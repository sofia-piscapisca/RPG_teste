//Atualizar destino
if (instance_exists(follow)) {
    x_to = follow.x;
    y_to = follow.y;
}

//Atualizar posição do objeto
x += (x_to - x) / 15;
y += (y_to - y) / 15;

//Manter a camera centrada dentro da sala
x = clamp(x, view_half_width, room_width - view_half_width);
y = clamp(y, view_half_height, room_height - view_half_height);

//Screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_half_width, y - view_half_height);