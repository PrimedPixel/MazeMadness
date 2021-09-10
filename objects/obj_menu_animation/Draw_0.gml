/// @desc
if gamepad_get_device_count() > 0
{
	var str = "Press Start";
}
else
{
	var str = "Press Enter";
}

#region Custom Messages

switch current_month
{
	case 1:
		switch current_day
		{
			case  1: str += "\n\nHappy New Year!"; break;
			case 31: str += "\n\nBored of January Memes?"; break;
			default: break;	 
		}					 
		break;
	case 4:
		switch current_day
		{
			case 20: str += "\n\nHappy Birthday Hit-\nI mean Primed Pixel!"; break;
			default: break;	
		}
		break;
	case 10:				 
		switch current_day	 
		{					 
			case 30: str += "\n\nHalloween Eve\nSpoopy"; break;
			case 31: str += "\n\nHappy Halloween!"; break;
			default: break;	 
		}					 
		break;				 
	case 12:				 
		switch current_day	 
		{					 
			case 24: str += "\n\nChristmas Eve!"; break;
			case 25: str += "\n\nMerry Christmas"; break;
			case 31: str += "\n\nNew Year's Eve"; break;
			default: break;
		}
	default: break;
}

#endregion

if alarm[0] <= 0
{
	draw_set_font(fnt_large);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	draw_text_color(room_width / 2, (room_height / 2), str, c_white, c_white, c_white, c_white, wave(1, 0, 4, 0));
	
	image_angle = wave(5, -5, 5, 0);
}

draw_sprite_ext(spr_logo, 0, x, y, image_xscale, image_xscale, image_angle, image_blend, image_alpha);

draw_set_alpha(rectangle_alpha);
draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);

draw_set_alpha(1);