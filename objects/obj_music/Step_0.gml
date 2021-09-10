/// @desc
if !audio_is_playing(audio)
{
	event_perform(ev_other, ev_user0);
}

if audio_sound_get_track_position(audio) < 10
{
	mus_display_x = lerp(mus_display_x, 2, 0.1);
	mus_display_xx = lerp(mus_display_xx, 2, 0.1);
}
else
{
	draw_set_font(fnt_normal);
	mus_display_x = lerp(mus_display_x, -string_width("Now Playing") - 12, 0.1);
	mus_display_xx = lerp(mus_display_xx, -string_width(mus_str), 0.1);	
}