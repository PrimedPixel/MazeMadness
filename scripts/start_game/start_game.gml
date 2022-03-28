// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function start_game()
{
	if global.players < 2
	{
		global.timetrial = true;
	}

	obj_menu.alarm[0] = 120;
	transition(60, 30, c_black, rm_1);

	global.seed_before = global.seed;
	
	save_game();
}