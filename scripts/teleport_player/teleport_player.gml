/// @desc
function teleport_player(target)
{
	var width = room_width div CELL_WIDTH;		//Find width / height in cells
	var height = room_height div CELL_HEIGHT;	//not in pixels
	var xx = irandom_range(1, width);			//Pick a random starting point
	var yy = irandom_range(1, height);
	
	//Iterate through the level tiles, starting from the initial random
				//while obj_level.grid[# xx, yy] != FLOOR
				//{
				//	var xx = wrap(xx + 1, 1, width);
				//	var yy = wrap(yy + 1, 1, height);
				//}
	
	suitable = false;
	for (var xxx = xx; xxx <= width; xxx++)
	{
		if obj_level.grid[# xx, yy] == FLOOR
		{
			suitable = true;
		}
		
		if suitable
		{
			break;
		}
		
		for (var yyy = yy; yyy <= height; yy++)
		{
			if obj_level.grid[# xx, yy] == FLOOR
			{
				suitable = true;
			}
		
			if suitable
			{
				break;	
			}
		}
	}

	//Move player to available tile
	target.x = (xx * CELL_WIDTH) + 4;
	target.y = (yy * CELL_HEIGHT) + 22;
	
	//Create animation object on player
	var ani = instance_create_layer(target.x, target.y, "Animations", obj_animation);
	ani.sprite_index = spr_teleport_animation;
	ani.target = target;
	
	//Vibrate player's controller
	obj_vibrate.controller[target.player_num] = 5;
	obj_vibrate.intensity = 0.5;
	
	//Play teleport sound
	audio_play_sound(snd_teleport, 0, false);
}