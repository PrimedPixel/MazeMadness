/// @desc Variables
#region Variables

reversed = false;
hsp = 0;
vsp = 0;
max_speed = global.max_speed;
accel = 0.5;
invis = false;
angl = 0;
hue = 0;
arrow = false;
additional_sprite = noone;
additional_sprite_index = 0;
active_powerups = ds_list_create()

move_x = 0;
move_y = 0;

//image_blend = make_color_rgb(global.player_1_red, global.player_1_green, global.player_1_blue);

#endregion

default_sprite = sprite_index;
if global.controller[0] != -1 && array_length(global.controller) >= player_num
{
	controller = global.controller[player_num];
}
else
{
	controller = -1;	
}

if gamepad_is_connected(controller)
{
	gamepad_set_axis_deadzone(controller, 0.1);	
}