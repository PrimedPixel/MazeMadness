function load_gui_scale()
{
	return ((display_get_gui_width() / obj_display_manager.ideal_width) - 1 );
}

function load_enemy_speed() {
	switch global.enemy_speed
	{
		case 1:
			return 0;
			break;
		case 2:
			return 1;
			break;
		case 5:
			return 2;
			break;
		case 10:
			return 3;
			break;
		case 100:
			return 4;
			break;
		case -1:
			return 5;
	}


}

function load_intensity() {
	switch global.gamepad_intensity
	{
		case 0:
			return 0;
			break;
		case 0.25:
			return 1;
			break;
		case 0.5:
			return 2;
			break;
		case 0.75:
			return 3;
			break;
		case 1:
			return 4;
			break;
	}


}

function load_player_speed() {
	switch global.max_speed
	{
		case 2:
			return 0;
			break;
		case 2.5:
			return 1;
			break;
		case 3:
			return 2;
			break;
		case 4:
			return 3;
			break;
		case 10:
			return 4;
			break;
		case 100:
			return 5;
	}


}

function load_players() 
{
	return global.players - 1;
}

function load_resolution() {
	switch window_get_width()
	{
		case 320:
			return 0;
			break;
		case 640:
			return 1;
			break;
		case 1280:
			return 2;
			break;
		case 1366:
			return 3;
			break;
		case 1920:
			return 4;
			break;
	}
}

function load_rounds() {
	switch global.max_rounds
	{
		//["10", "25", "30", "40", "50", "60", "75", "80", "90", "100", "Infinite"]
		case 10: return  0; break;
		case 25: return  1; break;
		case 30: return  2; break;
		case 40: return  3; break;
		case 50: return  4; break;
		case 60: return  5; break;
		case 75: return  6; break;
		case 80: return  7; break;
		case 90: return  8; break;
		case 100: return 9; break;
		
		case -1:
			return 10;
			break;
	}
}

function load_window_mode() {
	switch window_get_fullscreen()
	{
		case true:
			return 0;
			break;
		case false:
			return 1;
			break;
	}


}
