function change_rounds(argument0) {
	switch argument0
	{
		//["10", "25", "30", "40", "50", "60", "75", "80", "90", "100", "Infinite"]
		case 0: global.max_rounds = 10;  break;
		case 1: global.max_rounds = 25;  break;
		case 2: global.max_rounds = 30;  break;
		case 3: global.max_rounds = 40;  break;
		case 4: global.max_rounds = 50;  break;
		case 5: global.max_rounds = 60;  break;
		case 6: global.max_rounds = 75;  break;
		case 7: global.max_rounds = 80;  break;
		case 8: global.max_rounds = 90;  break;
		case 9: global.max_rounds = 100; break;
		
		case 10:
			global.max_rounds = -1;
			break;
	}


}
