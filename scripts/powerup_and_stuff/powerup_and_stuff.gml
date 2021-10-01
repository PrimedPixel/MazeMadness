/// @desc Performed every frame on a per-player basis
function powerup_and_stuff(ds_list_id)
{
	//Temporarily "reset" all variables altered by powerups
	{
		max_speed = global.max_speed;
		sprite_index = default_sprite;
		additional_sprite = noone;
		arrow = false;
		invis = false;
		reversed = false;
		
		if global.cheat[4] { arrow = true; }
		if global.cheat[5]
		{
			move_x *= -1;
			move_y *= -1;
			reversed = true; 
		}
		if global.cheat[6] { max_speed = global.max_speed * 2;}
	}
	
	//Checks every powerup
	var active_powerup_len = ds_list_size(ds_list_id)
	for (var i = 0; i < active_powerup_len; i++)
	{
		//Checks for any powerup with a "time" of less than 0
		if ds_list_id[| i][1] <= 0
		{
			//Removes powerup if time is 0
			ds_list_delete(ds_list_id, i);
			break;
		}
	
		//Decrease time on powerup
		ds_list_id[| i][1]--;
	
		//Change variables altered by powerups existing in ds_list
		switch ds_list_id[| i][0]
		{
			case powerup.speed:
				max_speed = global.max_speed * 2;
				additional_sprite = spr_lightning_animation;
				break;
			
			case powerup.freeze:
				sprite_index = spr_player_frozen;
				max_speed = 0;
				break;
			
			case powerup.reverse:
				move_x *= -1;
				move_y *= -1;
				reversed = true;
				break;
			
			case powerup.arrow:
				arrow = true;
				break;
		
			case powerup.invisible:
				invis = true;
				sprite_index = spr_eyes;
				break;
		
			default:
				show_message("ERROR:\nPowerup DS List Index Invalid\nPlease report this via Github, the game will now resume")
				break;
		}
	}
}