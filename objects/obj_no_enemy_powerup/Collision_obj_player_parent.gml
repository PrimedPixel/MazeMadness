/// @desc
image_xscale = 0;
mask_index = -1;
var active = false;

var inst_num = instance_number(obj_no_enemy_powerup)
for (var i = 0; i < inst_num; i++)
{
	var inst = instance_find(obj_no_enemy_powerup, i);
	if inst.alarm[0] > 0 && inst != id
	{
		active = true;
		inst.alarm[0] = 300;
		image_xscale = 0;
		
		alarm[1] = 1;
	}
}

if alarm[0] <= 0 || active
{
	if other.object_index == obj_player_1
	{
		obj_vibrate.controller_1 = 5;
	}
	else
	{
		obj_vibrate.controller_2 = 5;
	}
	
	obj_vibrate.intensity = 0.5;
	
	audio_play_sound(snd_enemy_freeze, 0, false);	
}

if alarm[0] <= 0 && !active
{
	obj_score.enemy_freeze_id = id;
	obj_enemy.spd = 0;
	obj_enemy.sprite_index = spr_enemy_freeze;
	alarm[0] = 300;
}

if active
{
	instance_destroy();
}