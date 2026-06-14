function player_state_free() { 
    //movimentação
    h_speed = lengthdir_x(input_magnitude * walk_speed, input_direction);
    v_speed = lengthdir_y(input_magnitude * walk_speed, input_direction);
    
    player_collision();
    
    //atualizar sprite index
    var _old_sprite = sprite_index;
    if (input_magnitude != 0) {
        direction = input_direction;
        sprite_index = sprite_run;
    }
    else {
        sprite_index = sprite_idle;
    }
    
    if (_old_sprite != sprite_index) {
        local_frame = 0;
    }
    
    //atualizar image index
    player_animate_sprite();
    
    //mudar state
    if (activate_key) {
        state = player_state_roll;
        move_remaining_distance = roll_distance
    }
}