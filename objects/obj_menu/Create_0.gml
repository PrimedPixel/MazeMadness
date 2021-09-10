/// @desc Initialize
alarm[1] = 1;

selected_x_offset = 0;
line_y_buffer = 64;
slider_accel = 0;
line_drawn = false;
line_start_y = 0;
line_end_y = 0;
start_y = -1;
logo_x = 160;
logo_y = 16;
stick_move_v = false;
stick_move_h = false;

//Themes
enum theme
{
	brick_dungeon,
	clouds,
	castle,
	grass,
	snow,
	forest,
	sand,
	autumn,
	space
}

//Basic Global Variables
global.theme = theme.brick_dungeon
global.enemy[0] = noone;
global.controller[0] = -1;

var controller_count = gamepad_get_device_count();
for (var i = 0; i <= controller_count; i++)
{
	if gamepad_is_connected(i)
	{
		global.controller[i] = i;
	}
}

if !variable_global_exists("key_enter")
{
	//Controls
	//global.key_revert = vk_escape;
	global.key_enter = vk_enter;

	ini_open("save.primedpixel")
	//Player 1 Controls
	global.key_up[0] =	  ini_read_real("Player 1 Controls", "Up",	  ord("W"));
	global.key_left[0] =  ini_read_real("Player 1 Controls", "Left",  ord("A"));
	global.key_right[0] = ini_read_real("Player 1 Controls", "Right", ord("D"));
	global.key_down[0] =  ini_read_real("Player 1 Controls", "Down",  ord("S"));
	global.key_start[0] = ini_read_real("Player 1 Controls", "Start",  vk_enter);

	//Player 2 Controls
	global.key_up[1] =	  ini_read_real("Player 2 Controls", "Up",	  vk_up);
	global.key_left[1] =  ini_read_real("Player 2 Controls", "Left",  vk_left);
	global.key_right[1] = ini_read_real("Player 2 Controls", "Right", vk_right);
	global.key_down[1] =  ini_read_real("Player 2 Controls", "Down",  vk_down);
	global.key_start[1] = ini_read_real("Player 1 Controls", "Start",  vk_space);

	//Player 3 Controls
	global.key_up[2] =	  ini_read_real("Player 3 Controls", "Up",	  ord("I"));
	global.key_left[2] =  ini_read_real("Player 3 Controls", "Left",  ord("J"));
	global.key_right[2] = ini_read_real("Player 3 Controls", "Right", ord("L"));
	global.key_down[2] =  ini_read_real("Player 3 Controls", "Down",  ord("K"));
	global.key_start[2] = ini_read_real("Player 1 Controls", "Start",  ord("O"));

	//Player 4 Controls
	global.key_up[3] =	  ini_read_real("Player 4 Controls", "Up",	  vk_numpad8);
	global.key_left[3] =  ini_read_real("Player 4 Controls", "Left",  vk_numpad4);
	global.key_right[3] = ini_read_real("Player 4 Controls", "Right", vk_numpad6);
	global.key_down[3] =  ini_read_real("Player 4 Controls", "Down",  vk_numpad5);
	global.key_start[3] = ini_read_real("Player 1 Controls", "Start",  vk_add);

	//Gameplay Options
	global.enemy_max =	 ini_read_real("Gameplay", "Enemy Max",   2);
	global.max_rounds =	 ini_read_real("Gameplay", "Max Rounds",  25);
	global.enemy_speed = ini_read_real("Gameplay", "Enemy Speed", 1);
	global.max_speed =	 ini_read_real("Gameplay", "Max Player Speed", 2);
	global.players =	 ini_read_real("Gameplay", "Players", 4);
	global.cheat[0] = false;
	global.cheat[1] = false;
	global.cheat[2] = false;
	global.cheat[3] = false;

	//Items
	global.speed_max =		ini_read_real("Items", "Speed",		   3);
	global.freeze_max =		ini_read_real("Items", "Freeze",	   2);
	global.swap_max =		ini_read_real("Items", "Swap",		   2);
	global.teleport_max =	ini_read_real("Items", "Teleport",	   0);
	global.reverse_max =	ini_read_real("Items", "Reverse",	   2);
	global.no_enemy_max =	ini_read_real("Items", "Enemy Freeze", 2);
	global.arrow_max =		ini_read_real("Items", "Arrow",		   1);
	global.camera_max =		ini_read_real("Items", "Camera",	   2);
	global.invis_max =		ini_read_real("Items", "Invisible",	   2);
	global.random_powerup = ini_read_real("Items", "Random",	   0);

	global.rm_width = 1024;
	global.rm_height = 1024;

	global.gamepad_intensity = ini_read_real("Gamepad Controls", "Vibration Intensity", 1);

	global.sound_gain = ini_read_real("Music and Sounds", "Sounds", 1);
	global.music_gain = ini_read_real("Music and Sounds", "Music",  1);

	audio_set_master_gain(0, ini_read_real("Music and Sounds", "Master Gain", 1));
	audio_group_set_gain(ag_sounds, global.sound_gain, 0);
	audio_group_set_gain(ag_music, global.music_gain, 0);

	window_set_fullscreen(ini_read_real("Graphics", "Fullscreen", false));
	window_set_size(ini_read_real("Graphics", "Window Width", window_get_width()), ini_read_real("Graphics", "Window Height", window_get_height()));

	var dm_width = obj_display_manager.ideal_width;
	var dm_height = obj_display_manager.ideal_height;
	var gui_scale = ini_read_real("Graphics", "GUI Scale", 2);

	display_set_gui_size(dm_width * (gui_scale + 1), dm_height * (gui_scale + 1));

	ini_close();

	if !variable_global_exists("seed")
	{
		global.seed = "Random";
		global.seed_before = global.seed;
	}
	else
	{
		global.seed = global.seed_before;
	}

	global.timetrial = false;
	global.game_time = 0;
	global.enemy_frozen = -1;

	for (var i = 0; i <= 3; i++)			//The player variables should always exist
	{										//even for non-existent players, so the
		global.player_score[i] = 0;			//players can be added without restarting the game
		global.player_hue[i] = 0;
	}
}

global.level = 1;

if gamepad_is_connected(0)
{
	stick_move_v = false;
	stick_move_h = false;
	
	gamepad_set_axis_deadzone(0, 0.1);
}

//Menu Pages
enum menu_page
{
	main,
	settings,
	audio,
	graphics,
	controls,
	play_settings,
	items,
	colours,
	gamepad_controls,
	height
}

//Menu Elements
enum menu_element_type
{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	type,
	type_num_only
}

//Create Menu Pages Grid
ds_menu_main = create_menu_page(
	["Play", menu_element_type.page_transfer, menu_page.play_settings],
	["Set Items",  menu_element_type.page_transfer,	menu_page.items],
	["Settings",   menu_element_type.page_transfer,	menu_page.settings],
	["Credits",	   menu_element_type.script_runner, credits_goto],
	
	["Exit",	   menu_element_type.script_runner,	end_game]
);

ds_menu_settings = create_menu_page(
	["Audio",			menu_element_type.page_transfer,	menu_page.audio],
	["Graphics",		menu_element_type.page_transfer,	menu_page.graphics],
	["Controls / Colours",		menu_element_type.script_runner,	controls_goto],
	
	["Back", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_audio = create_menu_page(
	["Master", menu_element_type.slider,	change_volume, audio_get_master_gain(0), [0,1]],
	["Sounds", menu_element_type.slider,	change_volume, global.sound_gain,		 [0,1]],
	["Music",  menu_element_type.slider,	change_volume, global.music_gain,		 [0,1]],
	
	["Back", menu_element_type.page_transfer, menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["Resolution", menu_element_type.shift,		change_resolution,	load_resolution(), ["320 x 180", "640 x 360", "1280 x 720", "1366 x 768", "1920 x 1080"]],
	["Window Mode", menu_element_type.toggle,	change_window_mode, load_window_mode(),["Fullscreen", "Windowed"]],
	["GUI Scale",	menu_element_type.shift,	change_gui_scale,	load_gui_scale(),  ["1", "2", "3", "4", "5"]],
	
	["Back", menu_element_type.page_transfer, menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["Player 1 Up",		menu_element_type.input,	"key_up_1",		global.key_up[0]],
	["Player 1 Left",	menu_element_type.input,	"key_left_1",	global.key_left[0]],
	["Player 1 Right",	menu_element_type.input,	"key_right_1",	global.key_right[0]],
	["Player 1 Down",	menu_element_type.input,	"key_down_1",	global.key_down[0]],
	
	["Player 2 Up",		menu_element_type.input,	"key_up_2",		global.key_up[1]],
	["Player 2 Left",	menu_element_type.input,	"key_left_2",	global.key_left[1]],
	["Player 2 Right",	menu_element_type.input,	"key_right_2",	global.key_right[1]],
	["Player 2 Down",	menu_element_type.input,	"key_down_2",	global.key_down[1]],
	
	["Back", menu_element_type.page_transfer, menu_page.settings]
);

ds_menu_play_settings = create_menu_page(
	["Players", menu_element_type.shift,		   change_players,		load_players(),				 ["1", "2", "3", "4"]],
	["Rounds", menu_element_type.shift,			   change_rounds,		load_rounds(),				 ["25", "50", "75", "100", "Infinite"]],
	["Enemies", menu_element_type.shift,		   change_enemies,		global.enemy_max,			 ["None", "1", "2", "3", "4", "5"]],
	["Enemy Speed", menu_element_type.shift,	   change_enemy_speed,  load_enemy_speed(),			 ["Normal", "Speedy", "Speed of Sound", "Speed of Light", "Death", "Literally Hell"]],
	["Max Player Speed", menu_element_type.shift,  change_player_speed, load_player_speed(),		 ["Normal", "Speedy", "Speed of Sound", "Speed of Light", "Death", "Literally Hell"]],
	["Powerup Mode", menu_element_type.toggle,     change_random_powerup,  global.random_powerup,    ["Normal", "Random"]],
	["Seed",  menu_element_type.type_num_only,			"seed", global.seed],
	["Start", menu_element_type.script_runner,	   start_game],
	
	["Back", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_items = create_menu_page(
	["Speed",		menu_element_type.shift,			change_speed,		global.speed_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Freeze",		menu_element_type.shift,			change_freeze,		global.freeze_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Swap",		menu_element_type.shift,			change_swap,		global.swap_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Teleport",	menu_element_type.shift,			change_teleport,	global.teleport_max, ["None", "1", "2", "3", "4", "5"]],
	["Reverse",		menu_element_type.shift,			change_reverse,		global.reverse_max,  ["None", "1", "2", "3", "4", "5"]],
	["Enemy Freeze",menu_element_type.shift,			change_no_enemy,	global.no_enemy_max, ["None", "1", "2", "3", "4", "5"]],
	["Arrow",		menu_element_type.shift,			change_arrow,		global.arrow_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Swap Camera", menu_element_type.shift,			change_camera,		global.camera_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Invisible",	menu_element_type.shift,			change_invis,		global.invis_max,	 ["None", "1", "2", "3", "4", "5"]],
	["Reset",		menu_element_type.script_runner,	reset_powerup],
	
	["Back", menu_element_type.page_transfer, menu_page.main]
);

//ds_menu_colours = create_menu_page(
//	["Player 1 Hue",	menu_element_type.slider, change_player_1_hue, global.player_hue[0],	[0, 6]],
//	["Player 2 Hue",	menu_element_type.slider, change_player_2_hue, global.player_hue[1], [0, 6]],

//	["Back", menu_element_type.page_transfer, menu_page.settings]
//);

if gamepad_is_connected(0)
{
	ds_menu_gamepad_controls = create_menu_page(
	["Vibration Intensity",		menu_element_type.shift,	change_intensity,	load_intensity(), ["None", "0.25x", "0.5x", "0.75x", "Full"]],
	
	["Back", menu_element_type.page_transfer, menu_page.settings]
	);
}

page = 0;

if gamepad_is_connected(0)
{
	menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_play_settings, ds_menu_items, ds_menu_gamepad_controls];	
}
else
{
	menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_play_settings, ds_menu_items];
}

var array_len = array_length_1d(menu_pages);
for (var i = 0; i < array_len; i++)
{
	menu_option[i] = 0;
}

inputting = false;