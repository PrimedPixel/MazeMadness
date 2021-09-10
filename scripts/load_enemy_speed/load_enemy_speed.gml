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
