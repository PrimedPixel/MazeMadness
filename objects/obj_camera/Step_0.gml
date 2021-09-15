/// @desc

for (var i = 1; i <= global.players; i++)
{
	if !instance_exists(target[i - 1])
	{
		show_error("ERROR:\nCamera for player " + string(i) + " not found\nPlease report this issue on Github", false);
		exit;
	}
	
	xx[i - 1] = lerp(xx[i - 1], target[i - 1].x, 0.1);
	yy[i - 1] = lerp(yy[i - 1], target[i - 1].y, 0.1);
	
	xx[i - 1] = clamp(xx[i - 1], (width * 0.5) + CELL_WIDTH, room_width - (width * 0.5) - CELL_WIDTH);
	yy[i - 1] = clamp(yy[i - 1], (height * 0.5) + CELL_HEIGHT, room_height - (height * 0.5) - CELL_HEIGHT);
	
	camera_set_view_pos(view_camera[i - 1], xx[i - 1] - (width * 0.5), yy[i - 1] - (height * 0.5));
}