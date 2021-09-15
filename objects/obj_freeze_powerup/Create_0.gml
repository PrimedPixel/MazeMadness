/// @desc
if global.timetrial
{
	instance_destroy();	
}

// Inherit the parent event
event_inherited();

mode = target_mode.other_player;
powerup_type = powerup.freeze;
powerup_time = 300;
powerup_sound = snd_freeze;