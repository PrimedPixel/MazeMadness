/// @desc
var target_temp;

for (var i = global.players - 1; i >= 0; i--)
{
	target_temp[i] = obj_camera.target[i];
}

target_temp = array_shuffle_unique(target_temp);

for (var i = 0; i <= global.players - 1; i++)
{
	obj_camera.target[i] = target_temp[i];
}

audio_play_sound(snd_screen_swap, 0, false);

instance_destroy();