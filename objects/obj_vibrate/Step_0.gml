/// @desc

var intens = intensity * global.gamepad_intensity;

if controller_1 > 0
{
	gamepad_set_vibration(0, intens, intens);
	
	controller_1--;
}
else
{
	gamepad_set_vibration(0, 0, 0);	
}

if controller_2 > 0
{
	gamepad_set_vibration(1, intens, intens);
	
	controller_2--;
}
else
{
	gamepad_set_vibration(1, 0, 0);	
}