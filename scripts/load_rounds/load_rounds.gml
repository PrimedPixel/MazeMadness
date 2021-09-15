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
