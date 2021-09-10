/// @desc
switch image_angle
{
	case 0: control = global.key_up[player_num]; break;
	case -90: control = global.key_right[player_num]; break;
	case -180: control = global.key_down[player_num]; break;
	case 90: control = global.key_left[player_num]; break;
	
	default: control = global.key_up[player_num]; break;
}

if inst.changing_controls == control_change
{
	image_blend = c_aqua;	
}
else
{
	image_blend = c_white;	
}