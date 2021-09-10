function change_resolution(argument0) {
	switch argument0
	{
		case 0:
			window_set_size(320, 180);
			break;
		case 1:
			window_set_size(640, 360);
			break;
		case 2:
			window_set_size(1280, 720);
			break;
		case 3:
			window_set_size(1366, 768);
			break;
		case 4:
			window_set_size(1920, 1080);
			break;
	}

	obj_display_manager.alarm[1] = 1;
}