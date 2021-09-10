///@desc get_controller_id(skip);
///@args skip
function get_controller_id() {

	var id_count = gamepad_get_device_count();

	for (var i = 0; i < id_count; i++)
	{
		if gamepad_is_connected(i)
		{
			if argument_count > 0 && argument[0] == i
			{
				//Do nothing
				show_debug_message("doing nothin'");
			}
			else
			{
				return i;
				show_debug_message("returned i");
				exit;
			}
		}
		else
		{
			return 0;	
		}
	}


}
