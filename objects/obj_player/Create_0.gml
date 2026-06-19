state = player_state_free;
last_state = state;

collision_map = layer_tilemap_get_id(layer_get_id("Colisoes"));

image_speed = 0;
h_speed = 0;
v_speed = 0;
walk_speed = 2;
roll_speed = 3;
roll_distance = 52;
bonk_distance = 40;
bonk_height_distance = 12;
bonk_speed = 1.5;
z = 0;

//Sprites
sprite_idle = spr_player;
sprite_run = spr_player_run;
sprite_roll = spr_player_roll;
local_frame = 0;