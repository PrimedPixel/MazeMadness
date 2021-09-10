function load_intensity() {
	switch global.gamepad_intensity
	{
		case 0:
			return 0;
			break;
		case 0.25:
			return 1;
			break;
		case 0.5:
			return 2;
			break;
		case 0.75:
			return 3;
			break;
		case 1:
			return 4;
			break;
	}


}
