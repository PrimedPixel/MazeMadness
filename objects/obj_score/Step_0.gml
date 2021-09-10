/// @desc

if completed
{
	obj_camera.draw_gui = false;
	
	if keyboard_check_pressed(vk_enter)
	{
		game_restart();
	}

	if gamepad_is_connected(0)
	{
		if gamepad_button_check_pressed(0, gp_face1)
		{
			game_restart();
		}
	}
}
else
{
	global.game_time += 1;
	
	if global.enemy_frozen >= 0
	{
		global.enemy_frozen--;
	}
}