/// @desc Draw version number
var latest_str = "\nLoading latest version";

if version != -1
{
	if version == GM_version
	{
		latest_str = "\nUp to date!";	
	}
	else
	{
		latest_str = "\nA new version is available\nPress F1 to close and download"
	}
}

draw_text_outline(display_get_gui_width() - 2, display_get_gui_height() - 2, "Version " + GM_version + latest_str, c_white, c_black, fa_right, fa_bottom, fnt_normal);