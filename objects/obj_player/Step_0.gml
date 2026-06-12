//inputs principais
left_key = keyboard_check(vk_left) || keyboard_check(ord("A"))
right_key = keyboard_check(vk_right) || keyboard_check(ord("D"))
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"))
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));

//inputs ações diversas
activate_key = keyboard_check_pressed(vk_space);
attack_key = keyboard_check_pressed(vk_shift);
item_key = keyboard_check_pressed(vk_control);

//vetores
input_direction = point_direction(0, 0, right_key - left_key, down_key - up_key);
input_magnitude = (right_key - left_key !=0) || (down_key - up_key !=0);

//movimentação
h_speed = lengthdir_x(input_magnitude * speed_walk, input_direction);
v_speed = lengthdir_y(input_magnitude * speed_walk, input_direction);

x += h_speed;
y += v_speed;
