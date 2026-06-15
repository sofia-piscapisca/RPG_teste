//Inicialização e globais
randomize();

global.game_paused = false;
global.text_speed = 0.75;
global.camera_instance = instance_create_layer(0, 0, layer, obj_camera);

//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
display_set_gui_size(RESOLUTION_W, RESOLUTION_H);
room_goto(ROOMSTART);
