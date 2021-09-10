/// @desc
	
var target = other;

if target.object_index == obj_player_1
{
	obj_vibrate.controller_1 = 5;
}
else
{
	obj_vibrate.controller_2 = 5;
}
	
obj_vibrate.intensity = 0.5;

audio_play_sound(snd_invisible, 0, false);

ds_list_add(target.active_powerups, [powerup.invisible, 600])

instance_destroy();