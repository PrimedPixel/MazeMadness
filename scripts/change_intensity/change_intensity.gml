function change_intensity(argument0) {
	switch argument0
	{
		case 0:
			global.gamepad_intensity = 0;
			break;
		case 1:
			global.gamepad_intensity = 0.25;
			break;
		case 2:
			global.gamepad_intensity = 0.5;
			break;
		case 3:
			global.gamepad_intensity = 0.75;
			break;
		case 4:
			global.gamepad_intensity = 1;
			break;
	}


}
