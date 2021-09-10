/// @desc Returns cheat

//checks whether it's loaded the value requested from the step event
if ds_map_find_value(async_load, "id") == async_id
{
	show_debug_message("async id matches!")
	//checks whether the message box was properly closed (true) or the game exited / crashed (false)
	if ds_map_find_value(async_load, "status")
	{
		show_debug_message("message box closed properly")
		//checks that the result was not nothing
		if ds_map_find_value(async_load, "result") != ""
		{
			var str = ds_map_find_value(async_load, "result");
			show_debug_message("loading result " + str);
			
			var len = array_length(cheat);
			for (var i = 0; i < len; i++)
			{
				if str == cheat[i]
				{
					global.cheat[i] = !global.cheat[i];	
				}
			}
		}
	}
}