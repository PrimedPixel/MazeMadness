/// @desc
var obj_create = noone;

if global.timetrial
{
	random_max = 4;
	spr_array[4] = spr_arrow_centered;
	spr_array[3] = spr_invisible;
	spr_array[2] = spr_no_enemy;
	spr_array[1] = spr_lightning;
	spr_array[0] = spr_teleport;
	
	switch sprite
	{
		case 0: obj_create = obj_teleport_powerup; break;
		case 1: obj_create = obj_speed_powerup; break;
		case 2: obj_create = obj_no_enemy_powerup; break;
		case 3: obj_create = obj_invisible; break;
		case 4: obj_create = obj_arrow_powerup; break;
	}
}
else
{
	switch sprite
	{
		case 0: obj_create = obj_teleport_powerup; break;
		case 1: obj_create = obj_swap_powerup; break;
		case 2: obj_create = obj_speed_powerup; break;
		case 3: obj_create = obj_screen_swap; break;
		case 4: obj_create = obj_reverse_controls_powerup; break;
		case 5: obj_create = obj_no_enemy_powerup; break;
		case 6: obj_create = obj_invisible; break;
		case 7: obj_create = obj_freeze_powerup; break;
		case 8: obj_create = obj_arrow_powerup; break;
	}	
}

instance_create_layer(x, y, "Instances", obj_create);
instance_destroy();