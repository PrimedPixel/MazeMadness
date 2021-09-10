/// @desc
if alarm[0] > 0
{
	x = approach(x, -sprite_width / 2, 15);
	
	if alarm[0] < 30
	{
		rectangle_alpha = approach(rectangle_alpha, 1, 0.05);
	}
}
else
{
	rectangle_alpha = approach(rectangle_alpha, 0, 0.05);
	
	x = room_width / 2;
	y = 32;
	
	image_xscale = 2;
}

if keyboard_check_pressed(vk_enter)
{
	room_goto_next();
	audio_play_sound(snd_select, 0, false);
}

if gamepad_get_device_count() > 0
{
	if gamepad_button_check_pressed(get_controller_id(), gp_start) || gamepad_button_check_pressed(get_controller_id(), gp_face1)
	{
		room_goto_next();
		audio_play_sound(snd_select, 0, false);
	}
}