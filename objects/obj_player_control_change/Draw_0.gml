/// @desc
draw_self();
var draw_str
switch control
{
	case vk_up:
		draw_str = "UP";
		break;
	case vk_left:
		draw_str = "<";
		break;
	case vk_down:
		draw_str = "DOWN";
		break;
	case vk_right:
		draw_str = ">";
		break;
	case vk_numpad0: draw_str = "0"; break;
	case vk_numpad1: draw_str = "1"; break;
	case vk_numpad2: draw_str = "2"; break;
	case vk_numpad3: draw_str = "3"; break;
	case vk_numpad4: draw_str = "4"; break;
	case vk_numpad5: draw_str = "5"; break;
	case vk_numpad6: draw_str = "6"; break;
	case vk_numpad7: draw_str = "7"; break;
	case vk_numpad8: draw_str = "8"; break;
	case vk_numpad9: draw_str = "9"; break;
	default:
		draw_str = chr(control);
		break;
}

var halign, valign, x_buffer, y_buffer;
switch image_angle
{
	case 0:		halign = fa_center; valign = fa_bottom;	x_buffer = 0;  y_buffer = 1; break;
	case -90:	halign = fa_left;	valign = fa_middle; x_buffer = 1;  y_buffer = 0; break;
	case -180:	halign = fa_center; valign = fa_top;	x_buffer = 0;  y_buffer = -1; break;
	case 90:	halign = fa_right;	valign = fa_middle; x_buffer = -1; y_buffer = 0; break;
	
	default: halign = fa_center; valign = fa_middle; break;
}

draw_set_halign(halign);
draw_set_valign(valign);
draw_set_colour(c_white);
draw_text(x + (x_buffer * 2), y + (y_buffer * 2), draw_str);