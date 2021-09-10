/// @desc
var obj_create = noone;

if global.timetrial
{
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
		default: show_message("uh oh"); break;
	}	
}

instance_create_layer(x, y, "Instances", obj_create);
instance_destroy();