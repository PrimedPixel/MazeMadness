/// @desc Randomise / Variables / Controller / Grid / Floor Tiles
if global.seed == "Random"
{
	randomise();
}
else
{
	show_debug_message("Current Seed: " + string(global.seed));
	random_set_seed(real(global.seed));
	global.seed = string(irandom(2147483647));	//32 bit unsigned integer limit is 4,294,967,295, signed is 2,147,483,647
												//it appears that YYC uses signed integers, so we're limited to 2,147,483,647
	show_debug_message("New Seed: " + string(global.seed));
}

var theme_no = irandom_range(0, 7);

switch theme_no
{
	case 0:
		global.theme = theme.brick_dungeon;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_floor);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_wall);
		shadow_spr = spr_shadow;
		break;
	case 1:
		global.theme = theme.clouds;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_cloud);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_sky);
		shadow_spr = spr_blank;
		break;
	case 2:
		global.theme = theme.castle;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_castle_floor);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_castle);
		shadow_spr = spr_shadow_castle;
		break;
	case 3:
		global.theme = theme.grass;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_grass);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_grass);
		shadow_spr = spr_blank;
		break;
	case 4:
		global.theme = theme.snow;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_snow);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_snow);
		shadow_spr = spr_blank;
		break;
	case 5:
		global.theme = theme.forest;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_forest);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_forest);
		shadow_spr = spr_blank;
		break;
	case 6:
		global.theme = theme.sand;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_sand);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_sand);
		shadow_spr = spr_blank;
		break;
	case 7:
		global.theme = theme.autumn;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_autumn);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_autumn);
		shadow_spr = spr_blank;
		break;
	case 8:
		global.theme = theme.space;
		layer_background_change(layer_background_get_id(layer_get_id("Background")), spr_space);
		tilemap_tileset(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), ts_space);
		shadow_spr = spr_blank;
}

#region Variables

var wall_map_id = layer_tilemap_get_id("Wall_Tiles");
shadow_surface = noone;

#region Grid

#region Variables

width = global.rm_width div CELL_WIDTH;
height = global.rm_height div CELL_HEIGHT;
grid = ds_grid_create(width, height);
global.enemy_grid = mp_grid_create(0, 0, width, height, CELL_WIDTH, CELL_HEIGHT);

tilemap_set_width(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), global.rm_width / 32);
tilemap_set_height(layer_tilemap_get_id(layer_get_id("Wall_Tiles")), global.rm_height / 32);

#endregion

ds_grid_set_region(grid, 0, 0, width, height, VOID);

#endregion

#region Contoller
var controller_x = width div 2;
var controller_y = height div 2;
player_start_x = controller_x * CELL_WIDTH + CELL_WIDTH / 2;
player_start_y = controller_y * CELL_HEIGHT + CELL_HEIGHT / 2;

for (var i = 1; i <= global.players; i++)
{
	var obj = asset_get_index("obj_player_" + string(i));
	instance_create_layer(player_start_x, player_start_y, "Instances", obj);
}

if !global.timetrial
{
	instance_create_layer(player_start_x, player_start_y, "Instances", obj_camera);
}
else
{
	instance_create_layer(player_start_x, player_start_y, "Instances", obj_camera_tt);
}

var controller_direction = irandom(3);
var steps = 388 + (12 * global.level);
var door = irandom_range(1, steps);

var speed_powerup;
speed_powerup[0] = noone;
for (var i = 0; i < round(global.speed_max * (width / 32)); i++)
{
	speed_powerup[i] = irandom_range(1, steps);
}

var swap_powerup;
swap_powerup[0] = noone;
for (var i = 0; i < round(global.swap_max * (width / 32)); i++)
{
	swap_powerup[i] = irandom_range(1, steps);
}

var freeze_powerup;
freeze_powerup[0] = noone;
for (var i = 0; i < round(global.freeze_max * (width / 32)); i++)
{
	freeze_powerup[i] = irandom_range(1, steps);
}

var teleport_powerup;
teleport_powerup[0] = noone;
for (var i = 0; i < round(global.teleport_max * (width / 32)); i++)
{
	teleport_powerup[i] = irandom_range(1, steps);
}

var enemy_position;
enemy_position[0] = noone;
for (var i = 0; i < global.enemy_max; i++)
{
	enemy_position[i] = irandom_range(1, steps);
}

var reverse_controls_powerup;
reverse_controls_powerup[0] = noone;
for (var i = 0; i < round(global.reverse_max * (width / 32)); i++)
{
	reverse_controls_powerup[i] = irandom_range(1, steps);
}

var no_enemy_powerup;
no_enemy_powerup[0] = noone;
for (var i = 0; i < round(global.no_enemy_max * (width / 32)); i++)
{
	no_enemy_powerup[i] = irandom_range(1, steps);
}

var arrow_powerup;
arrow_powerup[0] = noone;
for (var i = 0; i < round(global.arrow_max * (width / 32)); i++)
{
	arrow_powerup[i] = irandom_range(1, steps);
}

var camera_powerup;
camera_powerup[0] = noone;
for (var i = 0; i < round(global.camera_max * (width / 32)); i++)
{
	camera_powerup[i] = irandom_range(1, steps);
}

var invis_powerup;
invis_powerup[0] = noone;
for (var i = 0; i < round(global.invis_max * (width / 32)); i++)
{
	invis_powerup[i] = irandom_range(1, steps);
}

var direction_change_odds = 1; //Ranges from 0 - Odds, E.G: 4 is 1/5 chance etc.

#endregion

#endregion

#region Place Floor Tiles

#region Grid

for (var i = 1; i < steps; i++)
{
	if i == door
	{
		instance_create_layer(controller_x * CELL_WIDTH, controller_y * CELL_HEIGHT, "Instances", obj_door);
	}
	
	var array_speed = array_length_1d(speed_powerup);
	create_powerup(array_speed, speed_powerup, obj_speed_powerup, i, controller_x, controller_y);
	
	var array_swap = array_length_1d(swap_powerup);
	create_powerup(array_swap, swap_powerup, obj_swap_powerup, i, controller_x, controller_y);
	
	var array_freeze = array_length_1d(freeze_powerup);
	create_powerup(array_freeze, freeze_powerup, obj_freeze_powerup, i, controller_x, controller_y);
	
	var array_teleport = array_length_1d(teleport_powerup);
	create_powerup(array_teleport, teleport_powerup, obj_teleport_powerup, i, controller_x, controller_y);
	
	var array_reverse = array_length_1d(reverse_controls_powerup);
	create_powerup(array_reverse, reverse_controls_powerup, obj_reverse_controls_powerup, i, controller_x, controller_y);
	
	var array_arrow = array_length_1d(arrow_powerup);
	create_powerup(array_arrow, arrow_powerup, obj_arrow_powerup, i, controller_x, controller_y);
	
	var array_camera = array_length_1d(camera_powerup);
	create_powerup(array_camera, camera_powerup, obj_screen_swap, i, controller_x, controller_y);
	
	var array_invis = array_length_1d(invis_powerup);
	create_powerup(array_invis, invis_powerup, obj_invisible, i, controller_x, controller_y);
	
	if global.enemy_max > 0
	{	
		var array_enemy = array_length_1d(enemy_position);
		for (var j = 0; j < array_enemy; j++)
		{
			if i == enemy_position[j]
			{
				global.enemy[j] = instance_create_layer(controller_x * CELL_WIDTH, controller_y * CELL_HEIGHT, "Instances", obj_enemy);
			}
		}
	
		var array_no_enemy = array_length_1d(no_enemy_powerup);
		create_powerup(array_no_enemy, no_enemy_powerup, obj_no_enemy_powerup, i, controller_x, controller_y);
	}
	
	grid[# controller_x, controller_y] = FLOOR;
	
	if irandom(direction_change_odds) == direction_change_odds
	{
		controller_direction = irandom(3);	
	}
	
	var x_direction = lengthdir_x(1, controller_direction * 90);
	var y_direction = lengthdir_y(1, controller_direction * 90);
	
	controller_x += x_direction;
	controller_y += y_direction;

	if controller_x < 2 || controller_x >= width -2
	{
		controller_x += -x_direction * 2;
	}
	
	if controller_y < 2 || controller_y >= height -2
	{
		controller_y += -y_direction * 2;
	}
}

#endregion

#region Tiles

for (var yy = 1; yy < height - 1; yy++)
{
	for (var xx = 1; xx < width - 1; xx++)
	{
		var tile_index = scr_auto_tile_value_47(grid, xx, yy, VOID)
		
		if tile_index == 46
		{
			grid[# xx, yy] = FLOOR;	
		}
	}
}

for (var yy = 1; yy < height - 1; yy++)
{
	for (var xx = 1; xx < width - 1; xx++)
	{
		if grid[# xx, yy] != FLOOR
		{
			mp_grid_add_cell(global.enemy_grid, xx, yy);
			
			tilemap_set(wall_map_id, scr_auto_tile_value_47(grid, xx, yy, VOID), xx, yy);
		} 
	}
}

#endregion

#endregion

if global.random_powerup
{
	with par_powerup
	{
		instance_create_layer(x, y, "Instances", obj_random_powerup);
		instance_destroy();
	}
}