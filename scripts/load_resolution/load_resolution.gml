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
