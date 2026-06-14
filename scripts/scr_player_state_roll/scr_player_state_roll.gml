function player_state_roll() {
    //Movimentação
    h_speed = lengthdir_x(roll_speed, direction);
    v_speed = lengthdir_y(roll_speed, direction);
    
    move_remaining_distance = max(0, move_remaining_distance - roll_speed);
    var _collided = player_collision();
    
    //Atualizar sprite
    sprite_index = sprite_roll;
    var _total_frames = sprite_get_number(sprite_index) / 4;
    image_index = (CARDINALDIRECTION * _total_frames) + min(((1 - (move_remaining_distance / roll_distance)) * (_total_frames)), _total_frames - 1);
    
    //Mudar state
    if (move_remaining_distance <= 0) {
        state = player_state_free;
    }
    
    if (_collided) {
        state = player_state_free;
        screenshake(4, 30);
    }
}