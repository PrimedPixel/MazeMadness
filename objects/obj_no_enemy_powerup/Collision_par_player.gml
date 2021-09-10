/// @desc
if global.enemy_frozen <= 0
{
	global.enemy_frozen += 300
}

audio_play_sound(snd_enemy_freeze, 0, false);

instance_destroy();