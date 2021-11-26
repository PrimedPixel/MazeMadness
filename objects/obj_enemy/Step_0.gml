/// @desc
if !instance_exists(inst)
{
	exit;	
}

if !global.timetrial
{
	var invis_players = 0;
	for (var i = 1; i <= global.players; i++)
	{
		var player = asset_get_index("obj_player_" + string(i));
		if instance_exists(player)
		{
			if player.invis
			{
				invis_players++;
			}
		}
	}
	
	if invis_players >= global.players || global.enemy_frozen > 0
	{
		spd = 0;
	}
	else
	{
		spd	= global.enemy_speed;
	}
	
	if inst.invis && invis_players < global.players
	{
		counter = 0
		while inst.invis || counter >= 4
		{
			inst = asset_get_index("obj_player_" + string(wrap(real(string_char_at(object_get_name(inst.object_index), 12)) + 1, 1, global.players)));
			counter++;
		}
	}
}
else
{
	if obj_player_1.invis || global.enemy_frozen > 0
	{
		spd = 0;	
	}
	else
	{
		spd = global.enemy_speed;
	}
}

if instance_exists(inst)
{
	if mp_grid_path(global.enemy_grid, path, x, y, inst.x, inst.y, true)
	{
		path_start(path, spd, path_action_stop, false);
	}

	image_xscale = -sign(x - inst.x);
}