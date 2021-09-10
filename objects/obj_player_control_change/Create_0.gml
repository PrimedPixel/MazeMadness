/// @desc
control = global.key_up[player_num]

switch image_angle
{
	case 0: control_change = 0; break;			//up
	case -90: control_change = 3; break;		//right
	case -180: control_change = 1; break;		//down
	case 90: control_change = 2; break;			//left
	
	default: control_change = 0; break;
}

var inst_num = instance_number(obj_player_colour_change);
for (var i = 0; i <= inst_num; i++)
{
	var inst_looking = instance_find(obj_player_colour_change, i)
	if inst_looking.player_num == player_num
	{
		inst = inst_looking;
		break;
	}
}

if gamepad_is_connected(player_num)
{
	if image_angle != 0
	{
		image_xscale = 0;
	}
	else
	{
		sprite_index = spr_controller;	
	}
}