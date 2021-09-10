/// @desc
window_center();

if room == rm_display_init
{	
	if !variable_global_exists("seed")
	{
		room_goto_next();
	}
	else
	{
		room_goto(rm_menu);	
	}
}

show_debug_message(string(ideal_width) + " x " + string(ideal_height));