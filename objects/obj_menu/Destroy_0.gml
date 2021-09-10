var array_len = array_length_1d(menu_pages)
for (var i = 0; i < array_len; i++)
{
	ds_grid_destroy(menu_pages[i]);
}