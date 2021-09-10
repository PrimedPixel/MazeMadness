/// @desc
if window_get_width() != window_width && window_get_width() != 0
{
	surface_resize(application_surface, window_get_width(), window_get_height());
	window_width = window_get_width();
}