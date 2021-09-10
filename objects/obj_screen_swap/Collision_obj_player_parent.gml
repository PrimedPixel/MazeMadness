/// @desc

if obj_camera.target == obj_player_1
{
	obj_camera.target = obj_player_2;
	obj_camera.target_2 = obj_player_1;
}
else
{
	obj_camera.target = obj_player_1;
	obj_camera.target_2 = obj_player_2;	
}

obj_vibrate.controller_1 = 5;
obj_vibrate.controller_2 = 5;
	
obj_vibrate.intensity = 0.5;

audio_play_sound(snd_screen_swap, 0, false);

instance_destroy();