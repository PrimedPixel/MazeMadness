/// @desc shit. literal garbage
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

if completed
{
	player_3_gui();
	
	draw_set_alpha(0.7);
	draw_rectangle_colour(0, -1, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	//Decide on Win or Draw(s)
	var highest_score = 0;
	var winning_players;
	winning_players[0] = -1;
	
	for (var i = 1; i <= global.players; i++)
	{
		if highest_score < global.player_score[i - 1]
		{
			highest_score = global.player_score[i - 1];
			array_resize(winning_players, 1);
			winning_players[0] = i;
		}
		else if highest_score = global.player_score[i - 1]
		{
			winning_players[array_length(winning_players)] = i;
		}
	}
	
	//show_message("Highest Score: " + string(highest_score) + "\nWinning Players: " + string(winning_players));
	
	var winning_num = array_length(winning_players);
	var winning_coords;
	var player_spr_height = sprite_get_height(spr_player_1);
	
	for (var i = 0; i <= winning_num - 1; i++)
	{
		//switch winning_players[i]
		//{
		//	case 1: winning_coords = [gui_width / 4,				gui_height / 4]	break;
		//	case 2: winning_coords = [gui_width - (gui_width / 4),  gui_height / 4]	break;
		//	case 3: winning_coords = [gui_width / 4,				gui_height - (gui_height / 4)]	break;
		//	case 4: winning_coords = [gui_width - (gui_width / 4),	gui_height - (gui_height / 4)]	break;
		//}
		
		//Look at this nonsense code. It's a stupid way of doing it, I love it <3
		winning_coords = [(winning_players[i] mod 2 == 0 ? gui_width - (gui_width / 4) : gui_width / 4), (winning_num >= 3 ? (winning_players[i] >= 3 ? gui_height - (gui_height / 4) : gui_height / 4) : gui_height / 2)];
		
		shader_set(sh_hue);
		shader_set_uniform_f(shader_get_uniform(sh_hue, "Position"), global.player_hue[winning_players[i] - 1]);
		draw_sprite_ext(asset_get_index("spr_player_" + string(winning_players[i])), 0, winning_coords[0], winning_coords[1] + 50, 5, 5, 0, c_white, 1);	//the magic number 50 is: 5 * (sprite_height / 2 - (sprite height - sprite offset))
		shader_reset();
		
		draw_set_font(fnt_large);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text(winning_coords[0], winning_coords[1] - string_height("\n\n\nw"), "Score: " + string(global.player_score[winning_players[i] - 1]));
	}
	
	draw_set_valign(fa_middle);
	
	if winning_num <= 1
	{
		var str = "Player " + string(winning_players[0]) + " Won!";
	}
	else //Draw
	{
		var str = "Players: "
		
		for (var i = 0; i < winning_num - 1; i++)
		{
			str += string(winning_players[i]) + " & ";
		}
		
		str += string(winning_players[winning_num - 1]) + " Won!";
	}
	
	draw_text(gui_width / 2, gui_height / 2, str);
	
	draw_set_font(fnt_normal);
	draw_text(gui_width / 2, gui_height / 2 + 12, "Time: " + string_replace_all(string_format((global.game_time div 60) div 60, 2, 0), " ", "0") + ":" + string_replace_all(string_format((global.game_time div 60) mod 60, 2, 0), " ", "0") + "." + string(global.game_time mod 1000));
	
	if gamepad_is_connected(0)
	{
		str = "Press A";
	}
	else
	{
		str = "Press Enter";
	}
	
	draw_set_font(fnt_large);
	draw_text_color(gui_width / 2, gui_height / 2 + 64, str, c_white, c_white, c_white, c_white, wave(1, 0, 4, 0))
}

var enemy_frozen_str = "";
powerup_str = ["", "", "", ""];

function powerup_str_add(obj, str_var)
{
	if instance_exists(obj)
	{
		var active_powerup_len = ds_list_size(obj.active_powerups)
		for (var i = 0; i < active_powerup_len; i++)
		{
			var str = string(obj.active_powerups[| i][1] / 60)
			switch obj.active_powerups[| i][0]
			{
				case powerup.speed:
					powerup_str[str_var] += "\n255245104Speed: ";
					break;
			
				case powerup.freeze:
					powerup_str[str_var] += "\n121217243Frozen: ";
					break;
			
				case powerup.reverse:
					powerup_str[str_var] += "\n000174240Reversed: ";
					break;
			
				case powerup.arrow:
					powerup_str[str_var] += "\n051152075Arrow: ";
					break;
		
				case powerup.invisible:
					powerup_str[str_var] += "\n133133133Invisible: ";
					break;
				
				default:
					show_message("ERROR:\nPowerup DS List Index Invalid in Score Object\n\nPlease report this via Github, the game will now resume")
					break;
			}
			
			powerup_str[str_var] += string_delete(str, string_length(str), 1);
		}
	}
}

//Enemy Frozen Timer Calculation
if global.enemy_frozen > 0
{
		var val = global.enemy_frozen / 60;
		var enemy_frozen_str = "\nEnemy Frozen: " + string_format(val, string_length(string(val)) - 3, 1);
}

//Player Powerup Calculation
for (var i = 1; i <= global.players; i++)
{
	powerup_str_add(asset_get_index("obj_player_" + string(i)).object_index, i - 1);
}

//Player 1 Score
draw_text_outline(2, 2, "Player One Score: " + string(global.player_score[0]), c_white, c_black, fa_left, fa_top, fnt_normal);
draw_text_outline_split_colour(2, 12, powerup_str[0], c_black, fa_left, fa_top, fnt_normal);

if !global.timetrial
{
	//Player 2 Score
	draw_text_outline(gui_width - 2, 2, "Player Two Score: " + string(global.player_score[1]), c_white, c_black, fa_right, fa_top, fnt_normal);
	draw_text_outline_split_colour(gui_width - 2, 12, powerup_str[1], c_black, fa_right, fa_top, fnt_normal);
}
else
{
	//Timetrial Timer
	draw_text_outline(gui_width - 2, 2, "Time: " + string_replace_all(string_format((global.game_time div 60) div 60, 2, 0), " ", "0") + ":" + string_replace_all(string_format((global.game_time div 60) mod 60, 2, 0), " ", "0") + "." + string(global.game_time mod 1000), c_white, c_black, fa_right, fa_top, fnt_normal);	
}

if global.players >= 3
{
	//Player 3 Score
	draw_text_outline(2, gui_height - 2, "Player Three Score: " + string(global.player_score[2]), c_white, c_black, fa_left, fa_bottom, fnt_normal);
	draw_text_outline_split_colour(2, gui_height - 12, powerup_str[2], c_black, fa_left, fa_bottom, fnt_normal);	
}

if global.players >= 4
{
	//Player 4 Score
	draw_text_outline(gui_width - 2, gui_height - 2, "Player Four Score: " + string(global.player_score[3]), c_white, c_black, fa_right, fa_bottom, fnt_normal);
	draw_text_outline_split_colour(gui_width - 2, gui_height - 12, powerup_str[3], c_black, fa_right, fa_bottom, fnt_normal);	
}

//Round Number & Enemy Frozen Timer
draw_text_outline(gui_width / 2, 2, "Round: " + string(global.level) + "\n" + string(room_width / 32) + " x " + string(room_height / 32), c_white, c_black, fa_center, fa_top, fnt_normal);
draw_text_outline(gui_width / 2, 12, enemy_frozen_str, make_color_rgb(121,217,243), c_black, fa_center, fa_top, fnt_normal);