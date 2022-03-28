/// @desc

shader_set(sh_hue);
shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), global.player_hue[player_num]);
draw_self();
shader_reset();

var alignment = player_num mod 2 == 0 ? 1 : -1;

var y_centre = (y - (sprite_yoffset * 0.5));
draw_set_colour(c_white);
draw_rectangle(x + (50 * alignment), y_centre - 35, x + (50 * alignment), y_centre + 35, false);

var square_y = (y_centre + 35) - (70 * (global.player_hue[player_num] / 6.5));
draw_set_colour(c_yellow);
draw_rectangle(x + (48 * alignment), square_y - 2, x + (52 * alignment), square_y + 2, false);

var draw_str
switch global.key_start[player_num]
{
	case vk_enter: draw_str = "Enter"; break;
	case vk_space: draw_str = "Space"; break;
	case vk_ralt:  draw_str = "Alt GR"; break;
	case vk_backspace: draw_str = "Backspace"; break;
	default:
		draw_str = chr(global.key_start[player_num]);
		break;
		
}

draw_text_outline(x + (55 * alignment), y_centre, "Change:\n" + draw_str + "\n\nHue:\n" + string(floor((global.player_hue[player_num] / 6.5) * 100)), c_yellow, c_black, alignment == 1 ? fa_left : fa_right, fa_center, fnt_normal);