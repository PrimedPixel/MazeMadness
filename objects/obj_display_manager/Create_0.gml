/// @desc

// Game window 320 x 180
//Height = 180

ideal_width = 0;
ideal_height = 180;

if !variable_global_exists("seed")
{
	ini_open("save.primedpixel")
	saved_width = ini_read_real("Graphics", "Window Width", display_get_width())
	saved_height = ini_read_real("Graphics", "Window Height", display_get_height());
	ini_close();
}
else
{
	saved_width = window_get_width();
	saved_height = window_get_height();
}

aspect_ratio = saved_width / saved_height;

ideal_width = floor(ideal_height * aspect_ratio);
show_debug_message(ideal_width);

//Perfect Pixel Scaling
if saved_width mod ideal_width != 0
{
	var d = floor(saved_width / ideal_width);	
	ideal_width = saved_width / d;
}

if saved_height mod ideal_height != 0
{
	var d = floor(saved_height / ideal_height);
	ideal_height = saved_height / d;
}

if frac(ideal_width) == 0.5
{
	show_debug_message("We've got a problem!");
	ideal_width -= 0.5;
}

//Check for odd numbers
if ideal_width % 2 == 1
{
	ideal_width++;	
}

if ideal_height % 2 == 1
{
	ideal_height++;
}

var cam = camera_create_view(0, 0, ideal_width, ideal_height, 0, noone, 0, 0, 0, 0);
camera_set_view_size(cam, ideal_width, ideal_height);

for(var i = 1; i <= room_last; i++)
{
	if room_exists(i)
	{
		if i != rm_1
		{
			room_set_view_enabled(i, true);
			room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
			//room_set_camera(i, 0, cam)
		}
		else
		{
			room_set_view_enabled(i, true);
			room_set_viewport(i, 0, true, 0, 0, ideal_width / 2, ideal_height);
			room_set_viewport(i, 1, true, 0, 0, ideal_width / 2, ideal_height);
			//room_set_camera(i, 0, cam)	
		}
	}
}

var max_zoom = floor(saved_width / ideal_width);

if max_zoom mod 2 != 0
{
	max_zoom--;	
}

if max_zoom == 0
{
	max_zoom++;	
}

surface_resize(application_surface, ideal_width * max_zoom, ideal_height * max_zoom);
window_set_size(ideal_width * max_zoom, ideal_height * max_zoom);

window_width = ideal_width * max_zoom;

var multiplier = 2;

//if max_zoom > 2
//{
//	multiplier = max_zoom / 2;
//}

display_set_gui_size(ideal_width * multiplier, ideal_height * multiplier); //Makes GUI Smaller if the Game is Big Enough

alarm[0] = 1;