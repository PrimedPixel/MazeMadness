/// @desc
if global.timetrial
{
	random_max = 4;
	spr_array[4] = spr_arrow_centered;
	spr_array[3] = spr_invisible;
	spr_array[2] = spr_no_enemy;
	spr_array[1] = spr_lightning;
	spr_array[0] = spr_teleport;
}
else
{
	random_max = 8;
	spr_array[8] = spr_arrow_centered;
	spr_array[7] = spr_ice;
	spr_array[6] = spr_invisible;
	spr_array[5] = spr_no_enemy;
	spr_array[4] = spr_reverse_controls;
	spr_array[3] = spr_camera_swap;
	spr_array[2] = spr_lightning;
	spr_array[1] = spr_swap;
	spr_array[0] = spr_teleport;
}

sprite = irandom(random_max);
sprite_index = spr_array[sprite];

alarm[0] = 5;