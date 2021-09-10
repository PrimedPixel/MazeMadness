// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_outline_split_colour(xx, yy, str, outer, halign, valign, font)
{
	var split_str = string_split("\n", str, false);
	var split_str_len = array_length(split_str);
	
	if split_str_len > 1
	{
		for (var i = 1; i < split_str_len; i++)
		{
			var col_str = string_copy(split_str[i], 1, 9);
			var col = make_colour_rgb(real(string_copy(col_str, 1, 3)), real(string_copy(col_str, 4, 3)), real(string_copy(col_str, 7, 3)))
	
			draw_text_outline(xx, yy + ((i - 1) * 10), string_delete(split_str[i], 1, 9), col, outer, halign, valign, font);
		}
	}
}