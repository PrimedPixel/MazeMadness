/// @desc
draw_set_halign(fa_middle);
draw_set_valign(fa_top);

xx = display_get_gui_width() / 2
y_addition = sprite_get_height(spr_logo) + 5;

draw_sprite_ext(spr_logo, 0, xx, yy, 4, 4, 0, c_white, 1);

function text_block(title, subtitle, body)
{
	draw_set_font(fnt_large);
	draw_text(xx, yy + y_addition, title);
	y_addition += string_height(title);

	draw_set_font(fnt_large_small);
	draw_text(xx, yy + y_addition, subtitle);
	y_addition += string_height(subtitle);

	draw_set_font(fnt_normal);
	draw_text(xx, yy + y_addition, body);
	y_addition += string_height(body + "\n\n");
}

text_block("Programming", "Malachy Moran-Tun", "https://primedpixel.co.uk");

text_block("Spritework", "Kenney", "https://www.kenney.nl");
text_block("", "Heartbeast", "https://www.heartgamedev.com/");
text_block("", "Malachy Moran-Tun", "https://primedpixel.co.uk");

text_block("Original Idea", "Justin Tun", "");

text_block("Music", "Kevin MacLeod", "The Lift\nFurious Freak\nVoice Over Under\nMega Hyper Ultrastorm\nhttps://incompetech.com\nhttps://filmmusic.io\nLicense: CC BY http://creativecommons.org/licenses/by/4.0/");
text_block("", "Malachy Moran-Tun", "Sweet Chaos\nTime is of the Essence\nDigital Chips\nOrange Moon\nUranus\nMercury Memory\nShiny Eggs\nAggressive Tomato\nElectric Diamond\nPurple Mangoes\nSpace Cows\nWarm Danger\nPink Puppy\nhttps://primedpixel.co.uk");

text_block("Special Thanks", "Onyx Bragg", "Music Track Names and Overall Great Person :D");
text_block("", "YellowAfterlife", "execute_shell_simple\nGMLive\nGMTogether");
text_block("", "Heartbeast", "Original Maze Algorithm");
text_block("", "FriendlyCosmonaut", "Menu");
text_block("", "KeeVee", "Hue Shader");
text_block("", "YoYo Games", "Gamemaker Studio 2\nSplit Screen Camera Setup");
text_block("", "Shaun Spalding", "Gamemaker Tutorials");
text_block("", "itch.io", "Awesome Game Website");
text_block("", "Me", "i deserve credit too lmao");

text_block("Press ESC or B to Return to Menu", "", "");