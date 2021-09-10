/// @desc
#region Input
if obj_score.completed
{
	exit;
}

var key_up = keyboard_check(global.key_up[player_num]);
var key_left = keyboard_check(global.key_left[player_num]);
var key_down = keyboard_check(global.key_down[player_num]);
var key_right = keyboard_check(global.key_right[player_num]);

var key_move_x = key_right - key_left;
var key_move_y = key_down - key_up;

if gamepad_is_connected(controller)
{
	var d_up	= gamepad_button_check(controller, gp_padu);
	var d_left  = gamepad_button_check(controller, gp_padl);
	var d_down  = gamepad_button_check(controller, gp_padd);
	var d_right = gamepad_button_check(controller, gp_padr);
	
	var d_move_x = d_right - d_left;
	var d_move_y = d_down - d_up;
	
	var joy_move_x = sign(gamepad_axis_value(controller, gp_axislh));
	var joy_move_y = sign(gamepad_axis_value(controller, gp_axislv));
	
	move_x = max_abs(key_move_x, d_move_x, joy_move_x);
	move_y = max_abs(key_move_y, d_move_y, joy_move_y);
}
else
{
	move_x = key_move_x;
	move_y = key_move_y;
}

powerup_and_stuff(active_powerups);

if move_x != 0 || move_y != 0
{
	var dir = point_direction(0, 0, move_x, move_y);
	
	if gamepad_is_connected(controller) && max(abs(sign(gamepad_axis_value(controller, gp_axislh))), abs(sign(gamepad_axis_value(controller, gp_axislv)))) != 0
	{
		if reversed
		{
			var h_axis = -gamepad_axis_value(controller, gp_axislh);
			var v_axis = -gamepad_axis_value(controller, gp_axislv)
		}
		else
		{
			var h_axis = gamepad_axis_value(controller, gp_axislh);
			var v_axis = gamepad_axis_value(controller, gp_axislv)		
		}
		dir = point_direction(0, 0, h_axis, v_axis);
	}

	hsp += lengthdir_x(accel, dir);
	vsp += lengthdir_y(accel, dir);
}

#endregion

#region Acceleration

var spd = point_distance(0, 0, hsp, vsp);
var dir = point_direction(0, 0, hsp, vsp);

if global.cheat[1]
{
	var angle_prev = angl;
	var angle_next = dir;
	var angle_diff = angle_difference(angle_prev, angle_next);
	
	angle_next = angle_prev - angle_diff;
	
	angl = lerp(angl, angle_next - 90, 0.1);
}

if spd > max_speed
{
	hsp = lengthdir_x(max_speed, dir);
	vsp = lengthdir_y(max_speed, dir);
}

if !global.cheat[0]
{
	if global.cheat[2]
	{
		var frict = 0.05;
	}
	else
	{
		var frict = 0.2;	
	}
	
	if move_x == 0
	{
		hsp = lerp(hsp, 0, frict);
	}

	if move_y == 0
	{
		vsp = lerp(vsp, 0, frict);
	}
}

if move_x == 0 && move_y == 0
{
	image_speed = 0;
	image_index = 0;
}
else
{
	image_speed = 0.7;	
}
#endregion

#region Movement
x += hsp;

#region Horizontal Collisions
if hsp > 0
{
	image_xscale = 1;
	if grid_place_meeting(id, obj_level.grid)
	{
		x = bbox_right &~(CELL_WIDTH - 1);
		x -= bbox_right - x;
		hsp = 0;
	}
}
else if hsp < 0
{
	image_xscale = -1;
	if grid_place_meeting(id, obj_level.grid)
	{
		x = bbox_left &~(CELL_WIDTH - 1);
		x += CELL_WIDTH + x - bbox_left;
		hsp = 0;
	}
}

#endregion

#region Vertical Collisions
y += vsp;

if vsp > 0
{
	if grid_place_meeting(self, obj_level.grid)
	{
		y = bbox_bottom &~(CELL_HEIGHT - 1);
		y -= bbox_bottom - y;
		vsp = 0;
	}
}
else if vsp < 0
{
	if grid_place_meeting(self, obj_level.grid)
	{
		y = bbox_top &~(CELL_HEIGHT - 1);
		y += CELL_HEIGHT + y - bbox_top;
		vsp = 0;
	}
}

#endregion

#endregion

if (round(hsp) != 0 || round(vsp) != 0) && (move_x == 0 && move_y == 0)
{
	instance_create_layer(x - (hsp * 5), y - (vsp * 5), "Level", obj_footprint);
}

additional_sprite_index++;