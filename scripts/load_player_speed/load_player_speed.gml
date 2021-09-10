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
