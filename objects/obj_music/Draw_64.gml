/// @desc
if audio_sound_get_track_position(audio) < 15
{
	var yy = display_get_gui_height();
	
	if variable_global_exists("players")
	{
		if global.players >= 3 && room == rm_1
		{
			yy = display_get_gui_height() / 2;	
		}
	}
	
	draw_text_outline(mus_display_x + 12, yy - 24, "Now Playing", c_white, c_black, fa_left, fa_top, fnt_normal);
	draw_sprite_ext_outline(spr_note, 0, mus_display_x, yy - 24, 1, 1, 0, 1, c_black);
	draw_text_outline(mus_display_xx, yy - 2, mus_str, c_white, c_black, fa_left, fa_bottom, fnt_normal);	
}