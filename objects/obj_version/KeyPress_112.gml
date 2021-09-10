/// @desc
if version != -1 && version != GM_version
{
	//url_open("https://www.google.com"); doesn't work; chrome broke, use this magic bit of code instead
	var _url = "https://primedpixel.itch.io/maze-madness";
	var _path = game_save_id + "/shortcut.url";
	var _txt = file_text_open_write(_path);
	// note: use '' instead of @'' in GMS1
	file_text_write_string(_txt, @'[{000214A0-0000-0000-C000-000000000046}]
	Prop3=19,11
	[InternetShortcut]
	IDList=
	URL=' + _url);
	file_text_close(_txt);
	execute_shell_simple(_path);
	
	game_end();
}