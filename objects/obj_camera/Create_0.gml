/// @description Variables

//view = view_camera[0];
draw_gui = true;

for (var i = 1; i <= global.players; i++)
{
	xx[i - 1] = x;
	yy[i - 1] = y;
	target[i - 1] = asset_get_index("obj_player_" + string(i));
}

var _w = window_get_width();
var _h = window_get_height();

if global.players <= 2
{
	// Set up camera for view[0] (player 1)
	view_wport[0] = _w / 2; // We want the window to be 960x540 so set the view port to half the width

	// Set up camera for view[1] (player 2)
	view_xport[1] = _w / 2; // Offset the second view for player two within the game window
	view_wport[1] = _w / 2;
	
	//And we need to remove the other two ports
	view_visible[2] = false;
	view_visible[3] = false;
}
else
{
	// Set up camera for view[0] (player 1)
	view_wport[0] = _w / 2; // We want the window to be something similar to 960x540 so set the view port to half the width
	view_hport[0] = _h / 2;

	// Set up camera for view[1] (player 2)
	view_wport[1] = _w / 2;
	view_xport[1] = _w / 2;
	view_hport[1] = _h / 2;
	
	// Set up camera for view[2] (player 3)
	view_wport[2] = _w / 2;
	view_hport[2] = _h / 2;
	view_yport[2] = _h / 2;
	
	// Set up camera for view[3] (player 4)
	view_wport[3] = _w / 2;
	view_xport[3] = _w / 2;
	view_hport[3] = _h / 2;
	view_yport[3] = _h / 2;
	
	//Resize player 1 and 2 cameras
	camera_set_view_size(view_camera[0], 160, 90);
	camera_set_view_size(view_camera[1], 160, 90);
}

width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

// Resize the game window and the app surface to accomodate both view ports
var _dx = display_get_width() / 2;
var _dy = display_get_height() / 2;
window_set_rectangle(_dx - (_w / 2), _dy - (_h / 2), _w, _h);
surface_resize(application_surface, _w, _h);