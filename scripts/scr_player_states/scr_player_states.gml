//Free state
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
    
    //Lógica da tecla attack
    if (attack_key) {
        state = player_state_attack;
        state_attack = attack_slash;
    }
    
    
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


//Locked state
function player_state_locked() {
    //Não precisa fazer nada :P
}


//Roll state
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
        state = player_state_bonk;
        move_remaining_distance = bonk_distance;
        screenshake(4, 30);
    }
}


//Bonk state
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

function player_state_attack() {
    script_execute(state_attack);
}
