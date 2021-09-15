/// @desc

shader_set(sh_hue);
shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), global.player_hue[player_num]);
draw_self();
shader_reset();

var alignment = player_num mod 2 == 0 ? 1 : -1;

var y_centre = (y - (sprite_yoffset * 0.5));
draw_set_colour(c_white);
draw_rectangle(x + (50 * alignment), y_centre - 35, x + (50 * alignment), y_centre + 35, false);

var square_y = (y_centre + 35) - (70 * (global.player_hue[player_num] / 6.5));
draw_set_colour(c_yellow);
draw_rectangle(x + (48 * alignment), square_y - 2, x + (52 * alignment), square_y + 2, false);

draw_set_halign(alignment == 1 ? fa_left : fa_right);
draw_set_valign(fa_center);
draw_text(x + (55 * alignment), y_centre, "Hue:\n" + string(floor((global.player_hue[player_num] / 6.5) * 100)));