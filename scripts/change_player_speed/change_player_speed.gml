function change_player_speed(argument0) {
	switch argument0
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
