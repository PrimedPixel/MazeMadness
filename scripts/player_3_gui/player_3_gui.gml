// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_3_gui(){
	if global.players == 3
	{
		draw_set_colour(c_black);
		var gui_width = display_get_gui_width();
		var gui_height = display_get_gui_height();
		draw_rectangle(gui_width / 2, gui_height / 2, gui_width, gui_height, false);
		draw_sprite_ext(spr_logo, 0, (gui_width / 2) + (gui_width / 4), (gui_height / 2) + (gui_height / 4), 2, 2, 0, c_white, 1);
	}
}