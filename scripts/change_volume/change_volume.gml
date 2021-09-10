function change_volume(argument0) {
	var type = menu_option[page];

	switch type
	{
		case 0:
			audio_master_gain(argument0);
			break;
	
		case 1:
			audio_group_set_gain(ag_sounds, argument0, 0);
			global.sound_gain = argument0;
			break;
		
		case 2:
			audio_group_set_gain(ag_music, argument0, 0);
			global.music_gain = argument0;
			break;
	}


}
