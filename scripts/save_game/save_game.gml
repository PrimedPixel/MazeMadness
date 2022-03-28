/// @desc
function save_game()
{
	var fname = "save.primedpixel"

	if file_exists(fname)
	{
		file_delete(fname);
	}

	ini_open(fname);

	ini_write_real("Player 1 Controls", "Up",	 global.key_up[0]);
	ini_write_real("Player 1 Controls", "Left",  global.key_left[0]);
	ini_write_real("Player 1 Controls", "Down",	 global.key_down[0]);
	ini_write_real("Player 1 Controls", "Right", global.key_right[0]);

	ini_write_real("Player 2 Controls", "Up",	 global.key_up[1]);
	ini_write_real("Player 2 Controls", "Left",  global.key_left[1]);
	ini_write_real("Player 2 Controls", "Down",	 global.key_down[1]);
	ini_write_real("Player 2 Controls", "Right", global.key_right[1]);

	ini_write_real("Gamepad Controls", "Vibration Intensity", global.gamepad_intensity);

	ini_write_real("Music and Sounds", "Master Gain", audio_get_master_gain(0));
	ini_write_real("Music and Sounds", "Sounds",	  global.sound_gain);
	ini_write_real("Music and Sounds", "Music",		  global.music_gain);

	ini_write_real("Graphics", "Window Width",	window_get_width());
	ini_write_real("Graphics", "Window Height", window_get_height());
	ini_write_real("Graphics", "Fullscreen",	window_get_fullscreen());
	ini_write_real("Graphics", "GUI Scale",		(display_get_gui_width() / obj_display_manager.ideal_width) - 1)

	ini_write_real("Gameplay", "Preset", global.preset);

	//ini_write_real("Colours", "Player 1 Hue",		 global.player_1_hue);
	//ini_write_real("Colours", "Player 2 Hue",		 global.player_2_hue);

	ini_close();

	save_preset();
}