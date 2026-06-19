function new_textbox() {
    var _obj;
    if (instance_exists(obj_text)) {
        _obj = obj_text_queued;
    }
    else {
        _obj = obj_text;
    }
    
    with (instance_create_layer(x, y, "Instances", _obj)) {
        message = argument[0];
        
        if (instance_exists(other)) { 
            origin_instance = other.id; 
        }
        else {
            origin_instance = noone;
        }
        
        if (argument_count > 1) {
            background = argument[1];
        }
        else { 
            background = 1;
        }
        
        if (argument_count > 2) {
            //Tirar marcadores do texto da resposta
            responses = [];
            array_copy(responses, 0, argument[2], 0, array_length(argument[2]));
            for (var i = 0; i < array_length(responses); i++) {
                var _marker_position = string_pos(":", responses[i]);
                response_scripts[i] = string_copy(responses[i], 1, _marker_position - 1);
                response_scripts[i] = real(response_scripts[i]);
                responses[i] = string_delete(responses[i], 1, _marker_position);
            }
        }
        else {
            responses = [-1];
            response_scripts = [-1];
        }
    }

    with (obj_player) {
        if (state != player_state_locked) {
            last_state = state;
            state = player_state_locked;
        }
    }
}