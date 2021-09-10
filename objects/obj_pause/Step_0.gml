/// @desc

if gamepad_is_connected(global.controller[0])
{
	var gamepad_start = max(gamepad_button_check_pressed(global.controller[0], gp_start), gamepad_button_check(global.controller[0], gp_shoulderl) && gamepad_button_check_pressed(global.controller[0], gp_shoulderr));
}
else
{
	var gamepad_start = false;	
}

if keyboard_check_pressed(vk_escape) || gamepad_start //|| (!window_has_focus() && !paused)
{
	paused = !paused;
	
	if paused
	{
		pause_sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 
													false, false, 0, 0);
													
		instance_deactivate_all(true);
		instance_activate_object(obj_save);
		instance_activate_object(obj_music);
		
		audio_pause_all();
	}
	else
	{
		instance_activate_all();
		sprite_delete(pause_sprite);
		pause_sprite = noone;
		audio_resume_all();
	}
	
	audio_play_sound(snd_pause, 0, false);
}

if paused
{
	if gamepad_is_connected(global.controller[0])
	{
		if gamepad_button_check_pressed(global.controller[0], gp_select)
		{
			instance_activate_all();
			game_restart();	
		}
	}
	else if keyboard_check_pressed(ord("R"))
	{
		instance_activate_all();
		game_restart();		
	}
}