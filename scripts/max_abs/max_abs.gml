///@desc max_abs(val1, val2...);
///@args val1
///@args val2...
function max_abs() {
	var largest = -1;

	for (i = 0; i < argument_count; i++)
	{
		if abs(argument[i]) > largest
		{
			var return_num = i;
			largest = abs(argument[i]);
		}
	}

	return argument[return_num];


}
