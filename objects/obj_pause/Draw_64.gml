/// @desc

if paused
{
	player_3_gui();
	
	draw_sprite_ext(pause_sprite, 0, 0, 0, display_get_gui_width() / sprite_get_width(pause_sprite), display_get_gui_height() / sprite_get_height(pause_sprite), 0, c_white, 1);
	
	draw_set_alpha(0.7);
	draw_rectangle_colour(0, -1, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_font(fnt_large);
	
	draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Paused")
	
	draw_set_font(fnt_normal)
	
	if gamepad_is_connected(global.controller[0])
	{
		var str = "Press Select to Restart Game";	
	}
	else
	{
		var str = "Press R to Restart Game";
	}
	draw_text(display_get_gui_width() / 2, (display_get_gui_height() / 2) + 64, str);
	
	draw_text_outline(14, display_get_gui_height() - 24, "Current Music", c_white, c_black, fa_left, fa_top, fnt_normal);
	draw_sprite_ext_outline(spr_note, 0, 2, display_get_gui_height() - 24, 1, 1, 0, 1, c_black);
	draw_text_outline(2, display_get_gui_height() - 2, obj_music.mus_str, c_white, c_black, fa_left, fa_bottom, fnt_normal);
}