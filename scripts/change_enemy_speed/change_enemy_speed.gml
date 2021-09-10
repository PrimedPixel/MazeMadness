function change_enemy_speed(argument0) {
	switch argument0
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
