/// @desc
if mode == target_mode.object_self
{
	target[0] = other;
	obj_vibrate.controller[0] = 5;
}
else if mode == target_mode.other_player
{
	for (var i = 1; i <= global.players; i++)
	{
		target[i - 1] = asset_get_index("obj_player_" + string(i))	//adds upwards of 4 players to array
		obj_vibrate.controller[i - 1] = 5;							//and vibrates all their controllers
	}
	
	var player_array_len = array_length(target);
	for (var i = 0; i < player_array_len; i++)
	{
		//Removes player that collided with powerup from target array
		if target[i] = other.object_index
		{
			array_delete(target, i, 1);
			break;
		}
	}
}

var target_len = array_length(target);
for (var i = 0; i < target_len; i++)
{
	var found = false;
	
	//Check to see if powerup is already active
	var active_powerup_len = ds_list_size(target[i].active_powerups)
	for (var j = 0; j < active_powerup_len; j++)
	{
		if found
		{
			break;	
		}
		
		//Add time to already active powerup
		if target[i].active_powerups[| j][0] == powerup_type
		{
			found = true;
			target[i].active_powerups[| j][1] += powerup_time;
		}
	}
	
	if !found
	{
		ds_list_add(target[i].active_powerups, [powerup_type, powerup_time]);
	}
}

audio_play_sound(powerup_sound, 0, false);

instance_destroy();