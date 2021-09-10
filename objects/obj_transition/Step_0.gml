/// @desc

if !enabled && alpha > 0
{
	alpha -= 1 / time;
}

if enabled
{
	if time > 0 && alarm[1] <= 0
	{
		alarm[1] = time;
	}
	
	alpha += 1 / time;	
}