/// @desc
if spd != 0
{
	var shadow = spr_enemy_shadow;
	var spr = spr_enemy;
}
else
{
	var shadow = spr_frozen_shadow;
	var spr = spr_enemy_freeze;
}

draw_sprite_ext(shadow, 0, x, y+1, 1, -0.75, 0, c_white, 0.5);
draw_sprite_ext(spr, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);