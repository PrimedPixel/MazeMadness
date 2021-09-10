/// @description Insert description here
// You can write your code in this editor

//if !instance_exists(target) || !instance_exists(target_2)
//{
//	exit;
//}

//x = lerp (x, target.x, 0.1);
//xx = lerp(xx, target_2.x, 0.1);

//y = lerp (y, target.y, 0.1);
//yy = lerp(yy, target_2.y, 0.1);

//x = clamp(x, width / 2 + CELL_WIDTH, room_width - width / 2 - CELL_WIDTH);
//xx = clamp(xx, width / 2 + CELL_WIDTH, room_width - width / 2 - CELL_WIDTH);

//y = clamp(y, height / 2 + CELL_HEIGHT, room_height - height / 2 - CELL_HEIGHT);
//yy = clamp(yy, height / 2 + CELL_HEIGHT, room_height - height / 2 - CELL_WIDTH);

//camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
//camera_set_view_pos(view_camera[1], xx - width / 2, yy - height / 2);

for (var i = 1; i <= global.players; i++)
{
	if !instance_exists(target[i - 1])
	{
		show_message("ya fucked up");
		exit;
	}
	
	xx[i - 1] = lerp(xx[i - 1], target[i - 1].x, 0.1);
	yy[i - 1] = lerp(yy[i - 1], target[i - 1].y, 0.1);
	
	xx[i - 1] = clamp(xx[i - 1], (width * 0.5) + CELL_WIDTH, room_width - (width * 0.5) - CELL_WIDTH);
	yy[i - 1] = clamp(yy[i - 1], (height * 0.5) + CELL_HEIGHT, room_height - (height * 0.5) - CELL_HEIGHT);
	
	camera_set_view_pos(view_camera[i - 1], xx[i - 1] - (width * 0.5), yy[i - 1] - (height * 0.5));
}