/// @desc
var player_1_x = obj_player_1.x;
var player_1_y = obj_player_1.y;
var player_2_x = obj_player_2.x;
var player_2_y = obj_player_2.y;

obj_player_1.x = player_2_x;
obj_player_1.y = player_2_y;

obj_player_2.x = player_1_x;
obj_player_2.y = player_1_y;

var ani = instance_create_layer(obj_player_1.x, obj_player_1.y, "Animations", obj_animation);
ani.sprite_index = spr_teleport_animation;
ani.target = obj_player_1;

var ani = instance_create_layer(obj_player_2.x, obj_player_2.y, "Animations", obj_animation);
ani.sprite_index = spr_teleport_animation;
ani.target = obj_player_2;

obj_vibrate.controller_1 = 5;
obj_vibrate.controller_2 = 5;
	
obj_vibrate.intensity = 0.5;

audio_play_sound(snd_teleport, 0, false);

instance_destroy();