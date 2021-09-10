/// @description draw_text_outline(x,y,str,inner colour, outer colour, halign, valign, font)
/// @function draw_text_outline
/// @param x
/// @param y
/// @param str
/// @param inner colour
/// @param outer colour
/// @param halign
/// @param valign
/// @param font
function draw_text_outline(xx, yy, str, inner_colour, outer_colour, halign, valign, font) 
{
	
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_font(font);
	
	//Outline
	draw_set_colour(outer_colour);
	draw_text(xx+1, yy+1, str);  
	draw_text(xx-1, yy-1, str);  
	draw_text(xx, yy+1, str);  
	draw_text(xx+1, yy, str);  
	draw_text(xx, yy-1, str);  
	draw_text(xx-1, yy, str);
	draw_text(xx-1, yy+1, str);  
	draw_text(xx+1, yy-1, str);

	//Text  
	draw_set_colour(inner_colour);  
	draw_text(xx, yy, str);  


}
