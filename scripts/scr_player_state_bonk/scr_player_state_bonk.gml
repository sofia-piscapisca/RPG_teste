function player_state_bonk() { 
    //Movimentação
    h_speed = lengthdir_x(bonk_speed, direction - 180);
    v_speed = lengthdir_y(bonk_speed, direction - 180);
    
    move_remaining_distance = max(0, move_remaining_distance - bonk_speed);
    var _collided = player_collision();
    
    //Atualizar sprite
    sprite_index = spr_player_hurt;
    image_index = CARDINALDIRECTION - 2;
    
    //Mudar height
    z = sin(((move_remaining_distance / bonk_distance ) * pi)) * bonk_height_distance;
    
    //Mudar state
    if (move_remaining_distance <= 0) {
        state = player_state_free;
    }
}