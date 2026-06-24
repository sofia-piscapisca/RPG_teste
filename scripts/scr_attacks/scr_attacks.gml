function attack_slash () {
    if (sprite_index != spr_player_attack_slash) {
        sprite_index = spr_player_attack_slash;
        local_frame = 0;
        image_index = 0; 
    }
    
    //Atualizar sprite
    player_animate_sprite();
    
    if (animation_end) {
        state = player_state_free;
        animation_end = false;
    }
}


