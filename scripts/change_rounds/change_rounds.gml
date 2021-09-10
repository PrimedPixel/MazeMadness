function change_rounds(argument0) {
	switch argument0
	{
		case 0:
			global.max_rounds = 25;
			break;
		case 1:
			global.max_rounds = 50;
			break;
		case 2:
			global.max_rounds = 75;
			break;
		case 3:
			global.max_rounds = 100;
			break;
		case 4:
			global.max_rounds = -1;
			break;
	}


}
