/// @description draw_text_outline(x,y,str,inner colour, outer colour, halign, valign, font)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param alpha
/// @param outline_col
function draw_sprite_ext_outline(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
	
	var xx,yy;  
	xx = argument2;  
	yy = argument3;  

	//Outline 
	draw_sprite_ext(argument0, argument1, xx+1, yy+1, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx-1, yy-1, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx, yy+1, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx+1, yy, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx, yy-1, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx-1, yy, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx-1, yy+1, argument4, argument5, argument6, argument8, argument7);
	draw_sprite_ext(argument0, argument1, xx+1, yy-1, argument4, argument5, argument6, argument8, argument7);

	draw_sprite_ext(argument0, argument1, xx, yy, argument4, argument5, argument6, c_white, argument7);


}
