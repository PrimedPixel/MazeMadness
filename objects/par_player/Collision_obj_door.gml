/// @desc
if !obj_door.collide
{
	if !obj_score.completed
	{
		global.player_score[player_num]++;
		if global.level != global.max_rounds
		{
			global.level++;
			global.rm_width += 32;
			global.rm_height += 32;
			obj_door.mask_index = -1;
		
			transition(0, 15, c_white, noone);
		}
		else
		{
			obj_score.completed = true;
		}
	}

	obj_vibrate.controller_1 = 10;
	obj_vibrate.intensity = 1;

	audio_play_sound(snd_door, 0, false);
	
	obj_door.collide = true;
}