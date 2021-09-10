function change_gui_scale(argument0) {
	var dm_width = obj_display_manager.ideal_width;
	var dm_height = obj_display_manager.ideal_height;
	
	display_set_gui_size(dm_width * (argument0 + 1), dm_height * (argument0 + 1));
}