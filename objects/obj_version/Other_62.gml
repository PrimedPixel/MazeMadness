/// @desc Access result of the HTTP request

var json = async_load[? "result"]

//Convert the json to a ds_map (as that's easy to use in GM)
var map = json_decode(json);

if map == -1		//if the json is invalid
{
	show_message("Invalid json result for version checking")
	exit;	
}

if ds_map_exists(map, "latest")			//if there is a "key" inside the ds map
{
	version = map[? "latest"];
}