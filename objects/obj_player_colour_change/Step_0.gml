/// @desc

if !gamepad_is_connected(player_num)
{	
	var key_start = keyboard_check_pressed(global.key_start[player_num]);

	if key_start
	{
		changing_controls = 0;
		keyboard_lastkey = -1;
	}

	if changing_controls != -1
	{
		if keyboard_check_pressed(vk_anykey) && keyboard_lastkey != -1
		{
		
			switch changing_controls
			{
				case 0: global.key_up[player_num] =		keyboard_lastkey; changing_controls++; break;
				case 1: global.key_down[player_num] =	keyboard_lastkey; changing_controls++; break;
				case 2: global.key_left[player_num] =	keyboard_lastkey; changing_controls++; break;
				case 3: global.key_right[player_num] =	keyboard_lastkey; changing_controls = -1; break;
				default: changing_controls = -1; break;
			}
		}
	}
}

if changing_controls == -1
{
	var key_up = keyboard_check(global.key_up[player_num]);
	var key_down = keyboard_check(global.key_down[player_num]);

	var change = key_up - key_down;
	
	if change != 0
	{
				
		slider_accel = approach(slider_accel, 0.05, 0.0001);
		global.player_hue[player_num] = wrap(global.player_hue[player_num] + (slider_accel * change), 0, 6.5);
	}
	else
	{
		slider_accel = 0;	
	}
}