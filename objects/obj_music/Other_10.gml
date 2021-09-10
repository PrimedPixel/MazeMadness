/// @desc
randomise();
var num = irandom_range(1, 17);

while num == mus_prev
{
	num = irandom_range(1, 17);
}

if variable_global_exists("seed")
{
	if global.seed != "Random"
	{
		random_set_seed(real(global.seed));
	}
}

mus_prev = num;

mus = asset_get_index("mus_" + string(num));

audio = audio_play_sound(mus, 0 , false);
audio_sound_gain(audio, 0, 0);
audio_sound_gain(audio, 1, 1000);

switch mus
{
	case mus_1:
		mus_str = "The Lift - Kevin MacLeod";
		break;
	case mus_2:
		mus_str = "Furious Freak - Kevin MacLeod";
		break;
	case mus_3:
		mus_str = "Voice Over Under - Kevin MacLeod";
		break;
	case mus_4:
		mus_str = "Sweet Chaos - Malachy Tun / Primed Pixel";
		break;
	case mus_5:
		mus_str = "Mega Hyper Ultrastorm - Kevin MacLeod";
		break;
	case mus_6:
		mus_str = "Time is of the Essence - Malachy Tun / Primed Pixel";
		break;
	case mus_7:
		mus_str = "Digital Chips - Malachy Tun / Primed Pixel"
		break;
	case mus_8:
		mus_str = "Orange Moon - Malachy Tun / Primed Pixel";
		break;
	case mus_9:
		mus_str = "Uranus - Malachy Tun / Primed Pixel";
		break;
	case mus_10:
		mus_str = "Aggressive Tomato - Malachy Tun / Primed Pixel";
		break;
	case mus_11:
		mus_str = "Shiny Eggs - Malachy Tun / Primed Pixel";
		break;
	case mus_12:
		mus_str = "Mercury Memory - Malachy Tun / Primed Pixel";
		break;
	case mus_13:
		mus_str = "Purple Mangoes - Malachy Tun / Primed Pixel";
		break;
	case mus_14:
		mus_str = "Space Cows - Malachy Tun / Primed Pixel";
		break;
	case mus_15:
		mus_str = "Electric Diamond - Malachy Tun / Primed Pixel";
		break;
	case mus_16:
		mus_str = "Warm Danger - Malachy Tun / Primed Pixel";
		break;
	case mus_17:
		mus_str = "Pink Puppy - Malachy Tun / Primed Pixel";
		break;
}

draw_set_font(fnt_normal);
mus_display_xx = -string_width(mus_str) - 24;
mus_display_x = -string_width("Music");