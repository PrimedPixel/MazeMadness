var input_up = max(keyboard_check_pressed(global.key_up[0]), keyboard_check_pressed(global.key_up[1]));
var input_down = max(keyboard_check_pressed(global.key_down[0]), keyboard_check_pressed(global.key_down[1]));
var input_left = max(keyboard_check_pressed(global.key_left[0]), keyboard_check_pressed(global.key_left[1]));
var input_right = max(keyboard_check_pressed(global.key_right[0]), keyboard_check_pressed(global.key_right[1]));
var input_enter = keyboard_check_pressed(global.key_enter);

if gamepad_is_connected(global.controller[0])
{
	var input_up = gamepad_button_check_pressed(global.controller[0], gp_padu);
	var input_down = gamepad_button_check_pressed(global.controller[0], gp_padd);
	var input_left = gamepad_button_check_pressed(global.controller[0], gp_padr);
	var input_right = gamepad_button_check_pressed(global.controller[0], gp_padl);
	var input_enter = max(gamepad_button_check_pressed(global.controller[0], gp_face1), gamepad_button_check_pressed(global.controller[0], gp_select), gamepad_button_check_pressed(global.controller[0], gp_face2), gamepad_button_check_pressed(global.controller[0], gp_start));
	
	if !stick_move_v
	{
		if sign(gamepad_axis_value(global.controller[0], gp_axislv)) == -1
		{
			input_up = true;
			input_down = false;
			stick_move_v = true;
		}
		else if sign(gamepad_axis_value(global.controller[0], gp_axislv)) == 1
		{
			input_down = true;
			input_up = false;
			stick_move_v = true;
		}
	}

	if sign(gamepad_axis_value(global.controller[0], gp_axislv)) == 0
	{
		stick_move_v = false;
	}
	//----------------------------------------------------------------------\\
	if !stick_move_h
	{
		if sign(gamepad_axis_value(global.controller[0], gp_axislh)) == 1
		{
			input_left = true;
			input_right = false;
			stick_move_h = true;
		}
		else if sign(gamepad_axis_value(global.controller[0], gp_axislh)) == -1
		{
			input_right = true;
			input_left = false;
			stick_move_h = true;
		}
	}

	if sign(gamepad_axis_value(global.controller[0], gp_axislh)) == 0
	{
		stick_move_h = false;	
	}
}

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if inputting
{
	switch ds_grid[# 1, menu_option[page]]
	{
		case menu_element_type.shift:
			var h_input = input_right - input_left;	
			
			if gamepad_is_connected(global.controller[0])
			{
				h_input = input_left - input_right;	
			}
			
			if h_input != 0
			{
				ds_grid[# 3, menu_option[page]] += h_input;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) - 1);
			}
			break;
		
		case menu_element_type.slider:
			if gamepad_is_connected(global.controller[0])
			{
				var h_input = sign(gamepad_axis_value(0, gp_axislh));
			}
			else
			{
				var h_input = max(keyboard_check(global.key_right[0]), keyboard_check(global.key_right[1])) - max(keyboard_check(global.key_left[0]), keyboard_check(global.key_left[1]));
			}
			
			if h_input != 0
			{
				var arr = ds_grid[# 4, menu_option[page]];
				
				slider_accel = approach(slider_accel, 0.01, 0.0001);
				ds_grid[# 3, menu_option[page]] += h_input * slider_accel;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], arr[0], arr[1]);
			}
			else
			{
				slider_accel = 0;	
			}
			
			script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]])
			break;
			
		case menu_element_type.toggle:
			var h_input = input_right - input_left;	
			
			if gamepad_is_connected(global.controller[0])
			{
				h_input = input_left - input_right;	
			}
			
			if h_input != 0
			{
				ds_grid[# 3, menu_option[page]] += h_input;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
			break;
		
		case menu_element_type.input:
			var key = keyboard_lastkey;
			if key != global.key_enter
			{
				ds_grid[# 3, menu_option[page]] = key;
				variable_global_set(ds_grid[# 2, menu_option[page]], key);
			}
			break;
		
		case menu_element_type.type:
			var char = keyboard_string;
			
			if char != ""
			{
				ds_grid[# 3, menu_option[page]] = char;
				variable_global_set(ds_grid[# 2, menu_option[page]], char);
			}
			
			break;
		
		case menu_element_type.type_num_only:
			var char = string_digits(keyboard_string);
			
			if char != ""
			{
				ds_grid[# 3, menu_option[page]] = char;
				variable_global_set(ds_grid[# 2, menu_option[page]], char);
			}
			
			break;
	}
}
else
{
	keyboard_string = "";
	
	var option_change = input_down - input_up;

	if option_change != 0
	{
		selected_x_offset = 0;
	
		menu_option[page] += option_change;
	
		if menu_option[page] > ds_height - 1
		{
			menu_option[page] = 0;	
		}
	
		if menu_option[page] < 0
		{
			menu_option[page] = ds_height - 1;
		}
	}
}

if input_enter
{
	audio_play_sound(snd_select, 0, false);
	
	switch ds_grid[# 1, menu_option[page]]
	{
		case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[page]]);
			break;
		
		case menu_element_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]];
			break;
		
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle:
			if inputting
			{
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]])
			}
		case menu_element_type.input:
		case menu_element_type.type:
		case menu_element_type.type_num_only:
			inputting = !inputting;
			break;
	}
}

if menu_pages[page] == ds_menu_controls || menu_pages[page] == ds_menu_items
{
	logo_y = approach(logo_y, -16, 1);
}
else
{
	logo_y = approach(logo_y, 16, 0.5);
}

if alarm[0] > 0
{
	logo_y = lerp(logo_y, -sprite_get_height(spr_logo) * 2, 0.05);
}

if global.preset_name_prev != global.preset_name && input_enter
{
	save_preset();
	
	instance_destroy(obj_menu);
	var inst = instance_create_layer(0, 0, "Instances", obj_menu);
	inst.page = 5;
	inst.logo_y = -16;
	
	global.preset_name_prev = global.preset_name;
}