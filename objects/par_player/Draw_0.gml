/// @desc

if arrow
{
	draw_sprite_ext(spr_arrow, 0, x, y, image_xscale, image_yscale, point_direction(x, y, obj_door.x + 12, obj_door.y + 16) + 270, image_blend, image_alpha);
}

if sprite_index == spr_player_frozen
{
	draw_sprite_ext(spr_frozen_shadow, 0, x, y+1, 1, -0.75, 0, c_white, 0.5);
}
else
{
	shader_set(sh_hue);
	shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), global.player_hue[player_num]);

	draw_sprite_ext(shadow_sprite, 0, x, y + 1, 1, -0.75, 0, c_white, 0.5);
}

if !reversed
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angl, image_blend, image_alpha);	
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angl + 180, image_blend, image_alpha);	
}

shader_reset();


if global.cheat[3]
{
	shader_set(sh_hue);
	shader_set_uniform_f(shader_get_uniform(sh_hue, "u_Position"), hue);
	
	hue += 0.01;
}

if (current_month == 12 && current_day >= 1) || (current_month == 1 && current_day <= 6)
{
	if !reversed
	{
		draw_sprite_ext(spr_santa_hat, image_index, x, y, image_xscale, image_yscale, angl, image_blend, image_alpha);	
	}
	else
	{
		draw_sprite_ext(spr_santa_hat, image_index, x, y, image_xscale, image_yscale, angl + 180, image_blend, image_alpha);
	}
}

if additional_sprite != noone
{	
	draw_sprite(additional_sprite, (additional_sprite_index div 4) mod (sprite_get_number(additional_sprite) - 1), x, y);
}

//draw_text(x, y, string(x) + " ," + string(y));