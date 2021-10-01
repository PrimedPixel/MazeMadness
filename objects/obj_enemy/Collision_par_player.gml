/// @desc
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;
var xx = irandom_range(1, width);
var yy = irandom_range(1, height);

while obj_level.grid[# xx, yy] != FLOOR
{
	var xx = irandom_range(1, width);
	var yy = irandom_range(1, height);
}

target = other;
target.x = (xx * CELL_WIDTH) + 4;
target.y = (yy * CELL_HEIGHT) + 22;

var ani = instance_create_layer(target.x, target.y, "Animations", obj_animation);
ani.sprite_index = spr_teleport_animation;
ani.target = target;

obj_vibrate.controller[target.player_num] = 5;
obj_vibrate.intensity = 0.5;

audio_play_sound(snd_teleport, 0, false);