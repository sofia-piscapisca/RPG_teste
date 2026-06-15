function player_state_free() { 
    //Movimentação
    h_speed = lengthdir_x(input_magnitude * walk_speed, input_direction);
    v_speed = lengthdir_y(input_magnitude * walk_speed, input_direction);
    
    player_collision();
    
    //Atualizar sprite index
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
    
    //Atualizar image index
    player_animate_sprite();


        
    //Mudar state
    if (activate_key) {
        var _activate_x = lengthdir_x(10, direction);
        var _activate_y = lengthdir_y(10, direction);
        activate = instance_position(x + _activate_x, y + _activate_y, obj_parent_entity);
        
        //Roll se não tiver nada para ativar
        if (activate == noone || activate.entity_activate_script == -1) {
            state = player_state_roll;
            move_remaining_distance = roll_distance            
        }
        else {
            //Ativar entidade
            script_execute_ext(activate.entity_activate_script, activate.entity_activate_args);
            
            //Fazer o npc encarar o player
            if (activate.entity_npc) {
                with (activate) {
                    direction = other.direction + 180;
                    image_index = CARDINALDIRECTION;
                }
            }
        }
        
        
    }
}