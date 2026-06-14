//Inicialização e globais
randomize();

global.game_paused = false;
global.camera_instance = instance_create_layer(0, 0, layer, obj_camera);

room_goto(ROOMSTART);
