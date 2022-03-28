/// @desc Make HTTP request
version = -1;

var map = os_get_info()
if ds_map_exists(map, "gmt:is_server")
{
	if map[?"gmt:net_count"] == 2
	{
		instance_destroy();	
	}
}

http_get("https://itch.io/api/1/x/wharf/latest?target=primedpixel/mazemadness&channel_name=win");