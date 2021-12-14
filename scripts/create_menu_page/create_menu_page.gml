///@desc create_menu_page
///@arg ["Name 1", type 1, entries 1 etc...]
///@arg ["Name 2", type 2, entries 2 etc...]
function create_menu_page() {

	//Get Argument Count
	var arg = 0;
	for (var i = 0; i < argument_count; i++)
	{
		arg[i] = argument[i];	
	}

	var ds_grid_id = ds_grid_create(5, argument_count);

	for (i = 0; i < argument_count; i++)
	{
		var array = arg[i];
		var array_len = array_length(array);
	
		for (var xx = 0; xx < array_len; xx++)
		{
			ds_grid_id[# xx, i] = array[xx];	
		}
	}

	return ds_grid_id;


}
