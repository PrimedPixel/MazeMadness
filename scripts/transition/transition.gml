///@desc transition(delay,time,colour,room_target);
///@args delay
///@args time
///@args colour
///@args target
function transition(argument0, argument1, argument2, argument3) {

	if argument0 <= 0
	{
		obj_transition.enabled = true;
	}
	else
	{
		obj_transition.alarm[0] = argument0;	
	}

	obj_transition.time = argument1;
	obj_transition.colour = argument2;
	obj_transition.target = argument3;


}
