/// @desc
function teleport_player(target)
{
	var width = (room_width div CELL_WIDTH) - 1;		//Find width / height in cells
	var height = (room_height div CELL_HEIGHT) - 1;		//not in pixels
	//var x_start = irandom_range(0, width);
	//var y_start = irandom_range(0, height);
	//var xx = x_start;
	//var yy = y_start;
	
	//Iterate through the level tiles, starting from the initial random
	//while obj_level.grid[# xx, yy] != FLOOR
	//{
	//	xx = wrap(xx + 1, 1, width);
	//	yy = wrap(yy + 1, 1, height);
	//}
	
	//if obj_level.grid[# xx, yy] != FLOOR
	//{
	//	suitable = false;
	//	for (xxx = 0; xxx <= width; xxx++)
	//	{
	//		xx = wrap(xxx + x_start, 0, width)
	//		for (yyy = 0; yyy <= height; yyy++)
	//		{
	//			yy = wrap(yyy + y_start, 0, height)
				
	//			if obj_level.grid[# xx, yy] == FLOOR
	//			{
	//				suitable = true;
	//			}
		
	//			if suitable
	//			{
	//				break;	
	//			}
	//		}
		
	//		if suitable
	//		{
	//			break;
	//		}
	//	}
	//}
	
	var rand = irandom_range(0, array_length(obj_level.teleport_list) - 1);
	var xx = obj_level.teleport_list[rand][0];
	var yy = obj_level.teleport_list[rand][1];
	
	//Move player to available tile
	target.x = (xx * CELL_WIDTH) + 8;
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