function load_rounds() {
	switch global.max_rounds
	{
		case 25:
			return 0;
			break;
		case 50:
			return 1;
			break;
		case 75:
			return 2;
			break;
		case 100:
			return 3;
			break;
		case -1:
			return 4;
			break;
	}


}
