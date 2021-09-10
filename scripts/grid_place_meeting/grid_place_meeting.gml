///@desc grid_place_meeting(object, grid);
///@arg object
///@arg grid
function grid_place_meeting(argument0, argument1) {

	var obj = argument0;
	var grid = argument1;

	var top_right = grid[# (obj.bbox_right - 1) div CELL_WIDTH, obj.bbox_top div CELL_HEIGHT] == VOID;
	var top_left = grid[# obj.bbox_left div CELL_WIDTH, obj.bbox_top div CELL_HEIGHT] == VOID;
	var bottom_right = grid[# (obj.bbox_right - 1) div CELL_WIDTH, (obj.bbox_bottom -1) div CELL_HEIGHT] == VOID;
	var bottom_left = grid[# obj.bbox_left div CELL_WIDTH, (obj.bbox_bottom - 1) div CELL_HEIGHT] == VOID;

	return top_right || top_left || bottom_right || bottom_left;


}
