///@desc create_powerup(array_name,powerup_var,powerup_obj,passthrough_variable,controller_x,controller_y)
///@args array_name
///@args powerup_var
///@args powerup_obj
///@args passthrough_variable
///@args controller_x
///@args controller_y
function create_powerup(argument0, argument1, argument2, argument3, argument4, argument5) {

	for (var j = 0; j < argument0; j++)
	{
		if argument3 == argument1[j]
		{
			instance_create_layer(argument4 * CELL_WIDTH, argument5 * CELL_HEIGHT, "Instances", argument2);
		}
	}


}
