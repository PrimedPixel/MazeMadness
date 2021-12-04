/// @desc
teleport_player(other);

//Re-assign target to a random player
inst = asset_get_index("obj_player_" + string(irandom_range(1, global.players)));