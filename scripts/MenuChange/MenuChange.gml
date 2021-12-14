#region Powerups

function change_arrow(count) 
{
	global.arrow_max = count;
}

function change_camera(count) 
{
	global.camera_max = count;
}

function change_enemies(count)
{
	global.enemy_max = count;
}

function change_freeze(count)
{
	global.freeze_max = count;
}

function change_invis(count)
{
	global.invis_max = count;
}

function change_no_enemy(count) 
{
	global.no_enemy_max = count;
}

function change_reverse(count)
{
	global.reverse_max = count;
}

function change_speed(count)
{
	global.speed_max = count;
}

function change_swap(count)
{
	global.swap_max = count;
}

function change_teleport(count)
{
	global.teleport_max = count;
}

function change_random_powerup(count)
{
	global.random_powerup = count;
}

#endregion

#region Settings

function change_gui_scale(scale)
{
	var dm_width = obj_display_manager.ideal_width;
	var dm_height = obj_display_manager.ideal_height;
	
	display_set_gui_size(dm_width * (scale + 1), dm_height * (scale + 1));
}

function change_resolution(selection)
{
	switch selection
	{
		case 0:
			window_set_size(320, 180);
			break;
		case 1:
			window_set_size(640, 360);
			break;
		case 2:
			window_set_size(1280, 720);
			break;
		case 3:
			window_set_size(1366, 768);
			break;
		case 4:
			window_set_size(1920, 1080);
			break;
	}

	obj_display_manager.alarm[1] = 1;	//run the create event
}

function change_window_mode(selection)
{
	switch selection
	{
		case 0:
			window_set_fullscreen(true);
			break;
		case 1:
			window_set_fullscreen(false);
			break;
	}
}

function change_volume(selection)
{
	var type = menu_option[page];

	switch type
	{
		case 0:
			audio_master_gain(selection);
			break;
	
		case 1:
			audio_group_set_gain(ag_sounds, selection, 0);
			global.sound_gain = selection;
			break;
		
		case 2:
			audio_group_set_gain(ag_music, selection, 0);
			global.music_gain = selection;
			break;
	}
}

function change_intensity(selection) 
{
	switch selection
	{
		case 0:
			global.gamepad_intensity = 0;
			break;
		case 1:
			global.gamepad_intensity = 0.25;
			break;
		case 2:
			global.gamepad_intensity = 0.5;
			break;
		case 3:
			global.gamepad_intensity = 0.75;
			break;
		case 4:
			global.gamepad_intensity = 1;
			break;
	}
}

#endregion

#region Game Settings

function change_preset(count)
{
	save_preset();
	
	global.preset = count + 1;
	
	ini_open("save.primedpixel");
	ini_write_real("Gameplay", "Preset", global.preset);
	ini_close();
	
	instance_destroy(obj_menu);
	var inst = instance_create_layer(0, 0, "Instances", obj_menu);
	inst.page = 5;
	inst.logo_y = -16;
}

function change_enemy_speed(selection)
{
	switch selection
	{
		case 0:
			global.enemy_speed = 1;
			break;
		case 1:
			global.enemy_speed = 2;
			break;
		case 2:
			global.enemy_speed = 5;
			break;
		case 3:
			global.enemy_speed = 10;
			break;
		case 4:
			global.enemy_speed = 100;
			break;
		case 5:
			global.enemy_speed = -1;
	}
}

function change_player_speed(selection)
{
	switch selection
	{
		case 0:
			global.max_speed = 2;
			break;
		case 1:
			global.max_speed = 2.5;
			break;
		case 2:
			global.max_speed = 3;
			break;
		case 3:
			global.max_speed = 4;
			break;
		case 4:
			global.max_speed = 10;
			break;
		case 5:
			global.max_speed = 100;
	}
}

function change_players(count)
{
	global.players = count + 1;
}

function change_rounds(selection)
{
	switch selection
	{
		//["10", "25", "30", "40", "50", "60", "75", "80", "90", "100", "Infinite"]
		case 0: global.max_rounds = 10;  break;
		case 1: global.max_rounds = 25;  break;
		case 2: global.max_rounds = 30;  break;
		case 3: global.max_rounds = 40;  break;
		case 4: global.max_rounds = 50;  break;
		case 5: global.max_rounds = 60;  break;
		case 6: global.max_rounds = 75;  break;
		case 7: global.max_rounds = 80;  break;
		case 8: global.max_rounds = 90;  break;
		case 9: global.max_rounds = 100; break;
		
		case 10:
			global.max_rounds = -1;
			break;
	}
}

#endregion