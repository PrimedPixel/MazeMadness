/// @desc
function save_preset()
{
	var fname = "preset" + string(global.preset) + ".primedpixel"

	if file_exists(fname)
	{
		file_delete(fname);
	}

	ini_open(fname);

	ini_write_real("Gameplay", "Enemy Max",		   global.enemy_max);
	ini_write_real("Gameplay", "Max Rounds",	   global.max_rounds);
	ini_write_real("Gameplay", "Enemy Speed",	   global.enemy_speed);
	ini_write_real("Gameplay", "Max Player Speed", global.max_speed);
	ini_write_real("Gameplay", "Players",		   global.players);

	ini_write_real("Items", "Speed",		global.speed_max);
	ini_write_real("Items", "Freeze",		global.freeze_max);
	ini_write_real("Items", "Swap",			global.swap_max);
	ini_write_real("Items", "Teleport",		global.teleport_max);
	ini_write_real("Items", "Reverse",		global.reverse_max);
	ini_write_real("Items", "Enemy Freeze", global.no_enemy_max);
	ini_write_real("Items", "Arrow",		global.arrow_max);
	ini_write_real("Items", "Camera",		global.camera_max);
	ini_write_real("Items", "Invisible",	global.invis_max);
	ini_write_real("Items", "Random",	    global.random_powerup);
	
	ini_write_string("Name", "Name", global.preset_name);

	ini_close();
}