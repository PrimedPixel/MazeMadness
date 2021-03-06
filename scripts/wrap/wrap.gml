/// @desc wrap(value, min, max)
/// @function wrap(value, min, max)
/// @param value
/// @param min
/// @param max
function wrap(value, minimum, maximum) {
	// Returns the value wrapped, values over or under will be wrapped around

	if (value mod 1 == 0)
	{
	    while (value > maximum || value < minimum)
	    {
	        if (value > maximum)
	            value += minimum - maximum - 1;
	        else if (value < minimum)
	            value += maximum - minimum + 1;
	    }
	    return(value);
	}
	else
	{
	    var vOld = value + 1;
	    while (value != vOld)
	    {
	        vOld = value;
	        if (value < minimum)
	            value = maximum - (minimum - value);
	        else if (value > maximum)
	            value = minimum + (value - maximum);
	    }
	    return(value);
	}


}
