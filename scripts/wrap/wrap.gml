/// @description Wrap(value, min, max)
/// @function Wrap
/// @args value
/// @args min
/// @args max
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
