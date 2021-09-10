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
