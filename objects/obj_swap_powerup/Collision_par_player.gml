/// @desc
var coords;

for (var i = global.players - 1; i >= 0; i--)
{
	var inst = asset_get_index("obj_player_" + string(i + 1)).object_index;
	
	coords[i][1] = inst.y;
	coords[i][0] = inst.x;
}

coords = array_shuffle_unique(coords);

for (var i = 0; i <= global.players - 1; i++)
{
	var inst = asset_get_index("obj_player_" + string(i + 1)).object_index;
	
	inst.x = coords[i][0];
	inst.y = coords[i][1];
}

audio_play_sound(snd_teleport, 0, false);

instance_destroy();