/// @desc
yy -= 0.5;

if gamepad_is_connected(0)
{
	if gamepad_button_check_pressed(0, gp_face2)
	{
		room_goto(rm_menu);	
	}
}

if keyboard_check_pressed(vk_escape)
{
	room_goto(rm_menu);	
}