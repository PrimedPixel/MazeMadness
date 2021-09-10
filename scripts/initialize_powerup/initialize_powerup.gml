///@desc initialize_powerup(var,number_of_powerups)
///@args var
///@args number_of_powerups
function initialize_powerup(argument0, argument1) {

	for (var i = 0; i < argument1; i++)
	{
		argument0[i] = irandom_range(1, 400);
	}


}
