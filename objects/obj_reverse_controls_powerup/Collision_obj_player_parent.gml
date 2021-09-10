/// @desc
var target = other;

if target.object_index == obj_player_2
{
	target = obj_player_1;
}
else
{
	target = obj_player_2;
}

obj_vibrate.controller_1 = 5;
obj_vibrate.controller_2 = 5;
	
obj_vibrate.intensity = 0.5;

audio_play_sound(snd_reverse, 0, false);

ds_list_add(target.active_powerups, [powerup.reverse, 300])

instance_destroy();