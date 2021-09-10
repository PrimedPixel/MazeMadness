var g_width = display_get_gui_width(), g_height = display_get_gui_height();

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 64, x_buffer = 32;

if menu_pages[page] == ds_menu_controls || menu_pages[page] == ds_menu_items || menu_pages[page] == ds_menu_play_settings
{
	y_buffer = 32;
}

if menu_pages[page] == ds_menu_main
{
	y_buffer = 48;
}

if alarm[0] > 0
{
	start_y = lerp(start_y, room_height * 2.5, 0.025);
}
else
{
	start_y = (g_height / 2) - (((ds_height - 1) / 2) * y_buffer)	
}

var start_x = g_width / 2;
var c = c_black

//Draw Elements on the Left
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, x_offset;

for (var yy = 0; yy < ds_height; yy++)
{
	lty = start_y + (yy * y_buffer);
	
	x_offset = 0;
	c = c_white;
	
	if yy == menu_option[page]
	{
		c = c_yellow;
		selected_x_offset = approach(selected_x_offset, -16, 1);
		x_offset = selected_x_offset;
	}
	
	draw_text_outline(ltx + x_offset, lty, ds_grid[# 0, yy], c, c_black, fa_right, fa_middle, fnt_large);
	
	if menu_pages[page] == ds_menu_items
	{
		switch yy
		{
			case 0:
				var item_icon = spr_lightning;
				break;
			case 1:
				var item_icon = spr_ice;
				break;
			case 2:
				var item_icon = spr_swap;
				break;
			case 3:
				var item_icon = spr_teleport;
				break;
			case 4:
				var item_icon = spr_reverse_controls;
				break;
			case 5:
				var item_icon = spr_no_enemy;
				break;
			case 6:
				var item_icon = spr_arrow_centered;
				break;
			case 7:
				var item_icon = spr_camera_swap;
				break;
			case 8:
				var item_icon = spr_invisible;
				break;
			case 9:
				var item_icon = spr_blank;
				break;
		}
		
		draw_sprite_ext(item_icon, 0,
		((ltx + x_offset) - string_width(ds_grid[# 0, yy]) - (sprite_get_width(item_icon) / 2) - 16) + sprite_get_xoffset(item_icon),	//x value
		(lty - (sprite_get_height(item_icon) / 2) + (6 * sign(sprite_get_yoffset(item_icon)))) + sprite_get_yoffset(item_icon),	//y value
		1, 1, 0, c_white, 1);
	}
}

//Draw Dividing Line
if !line_drawn
{
	line_start_y = start_y;
	line_end_y = lty;
	line_y_buffer = 16;
	
	line_drawn = true;
}


line_start_y = approach(line_start_y, start_y, 1);
line_end_y = approach(line_end_y, lty, 1);
line_y_buffer = approach(line_y_buffer, 16, 1)

if alarm[0] > 0
{
	line_start_y = start_y;
	line_end_y = lty;
}

c = c_black;
draw_rectangle_color(start_x - 1, line_start_y - line_y_buffer - 1, start_x + 1, line_end_y + line_y_buffer + 1, c, c, c, c, false);

c = c_white;
draw_rectangle_color(start_x, line_start_y - line_y_buffer, start_x, line_end_y + line_y_buffer, c, c, c, c, false);

//Draw Right Elements
draw_set_halign(fa_left);
draw_set_font(fnt_normal_large);

var rtx = start_x + x_buffer, rty;

for (yy = 0; yy < ds_height; yy++)
{
	rty = start_y + (yy * y_buffer);
	
	switch ds_grid[# 1, yy]
	{
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			if current_val == 0
			{
				left_shift = "";
			}
			
			if current_val == array_length_1d(ds_grid[# 4, yy]) - 1
			{
				right_shift = "";
			}
			
			c = c_white;
			
			if inputting && yy == menu_option[page]
			{
				c = c_yellow;
			}
			
			draw_text_outline(rtx, rty, left_shift + string(current_array[current_val]) + right_shift, c, c_black, fa_left, fa_middle, fnt_normal_large);
			break;
			
		case menu_element_type.slider:
			var len = 96;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var pos = (current_val - current_array[0]) / (current_array[1] - current_array[0]);
			
			c = c_black;
			draw_line_width_color(rtx, rty, rtx + len, rty, 7, c, c);
			
			c = c_white;
			draw_line_width_color(rtx + 1, rty, rtx + len - 1, rty, 5, c, c);
			 
			c = c_white;
			
			if inputting && yy == menu_option[page]
			{
				c = c_yellow;
			}
			
			draw_rectangle_color(rtx + (pos * len) - 6, rty - 6, rtx + (pos * len) + 6, rty + 6, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(rtx + (pos * len) - 4, rty - 4, rtx + (pos * len) + 4, rty + 4, c, c, c, c, false);
			
			//if menu_pages[page] != ds_menu_colours
			//{
			//	var add = "%";	
			//}
			//else
			//{
			//	var add = "";	
			//}
			
			draw_text_outline(rtx + (len * 1.2), rty, string(floor(pos * 100)), c, c_black, fa_left, fa_middle, fnt_normal_large);
			
			//if menu_pages[page] == ds_menu_colours
			//{
			//	shader_set(sh_hue);
			//	shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), global.player_hue[0]);
			//	draw_sprite_ext(spr_player, 0, 16 + ((sprite_get_width(spr_player) / 2) * 8), (display_get_gui_height() / 2) + 88, 8, 8, 0, c_white, 1);
			//	shader_reset();
				
			//	shader_set(sh_hue);
			//	shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), global.player_hue[1]);
			//	draw_sprite_ext(spr_player_2, 0, display_get_gui_width() - (16 + ((sprite_get_width(spr_player_2) / 2) * 8)), (display_get_gui_height() / 2) + 88, -8, 8, 0, c_white, 1);
			//	shader_reset();
			//}
			break;
			
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var arr = ds_grid[# 4, yy]
			var c1, c2;
			c = c_white;
			
			if inputting && yy == menu_option[page]
			{
				c = c_yellow;
			}
			
			if current_val == 0
			{
				c1 = c;
				c2 = c_dkgray;
				f1 = fnt_normal_large;
				f2 = fnt_normal
			}
			else
			{
				c1 = c_dkgray;
				c2 = c;
				f1 = fnt_normal;
				f2 = fnt_normal_large
			}
			
			draw_text_outline(rtx, rty, arr[0], c1, c_black, fa_left, fa_middle, f1);
			draw_text_outline(rtx + string_width(arr[0]) + 8, rty, arr[1], c2, c_black, fa_left, fa_middle, f2);
			break;
			
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			
			switch current_val
			{
				case vk_up:
					string_val = "UP ARROW";
					break;
				case vk_left:
					string_val = "LEFT ARROW";
					break;
				case vk_down:
					string_val = "DOWN ARROW";
					break;
				case vk_right:
					string_val = "RIGHT ARROW";
					break;
				case vk_space:
					string_val = "SPACE BAR";
					break;
				default:
					string_val = chr(current_val);
					break;
			}
			
			c = c_white;
			
			if inputting && yy == menu_option[page]
			{
				c = c_yellow;
			}
			
			draw_text_outline(rtx, rty, string_val, c, c_black, fa_left, fa_middle, fnt_normal_large);
			break;
		
		case menu_element_type.type:
		case menu_element_type.type_num_only:
			var current_val = ds_grid[# 3, yy];
			
			c = c_white;
			
			if inputting && yy == menu_option[page]
			{
				c = c_yellow;
			}
			
			draw_text_outline(rtx, rty, current_val, c, c_black, fa_left, fa_middle, fnt_normal_large);
			break;
	}
}

//Reset
draw_set_valign(fa_top);