/// @desc

if !surface_exists(shadow_surface)
{
	shadow_surface = surface_create(room_width, room_height);
	surface_set_target(shadow_surface);
	draw_clear_alpha(c_black, 0);
	
	for (var yy = 0; yy < height - 1; yy++)
	{
		for (var xx = 0; xx < width - 1; xx++)
		{
			if grid[# xx, yy] == FLOOR && grid[# xx, yy - 1] == VOID
			{
				draw_sprite_ext(shadow_spr, 0, xx * CELL_WIDTH, yy * CELL_HEIGHT, 1, 1, 0, c_white, 0.5);	
			}
		}
	}
	
	surface_reset_target();
}

draw_surface(shadow_surface, 0, 0);