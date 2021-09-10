/// @desc
image_xscale = 0;
mask_index = -1;
target = obj_player_2;

var active = false;

var inst_num = instance_number(obj_reverse_controls_powerup)
for (var i = 0; i < inst_num; i++)
{
	var inst = instance_find(obj_reverse_controls_powerup, i);
	if inst.alarm[0] > 0 && inst.target == obj_player_2 && inst != id
	{
		active = true;
		inst.alarm[0] = 300;
	}
}

if alarm[0] <= 0 || active
{
	obj_vibrate.controller_1 = 5;
	obj_vibrate.controller_2 = 5;
	
	obj_vibrate.intensity = 0.5;
	
	audio_play_sound(snd_reverse, 0, false);	
}

if alarm[0] <= 0 && !active
{
	target.reversed = true;
	target.reverse_id = id;
	alarm[0] = 300;
}

if active
{
	instance_destroy();
}