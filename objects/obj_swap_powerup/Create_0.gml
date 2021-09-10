/// @desc
target = noone;

if place_meeting(x, y, obj_swap_powerup)
{
	instance_destroy();	
}

if global.timetrial
{
	instance_destroy();	
}