// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_powerup(){

	global.speed_max =	  3;
	global.freeze_max =	  2;
	global.swap_max =	  2;
	global.teleport_max = 0;
	global.reverse_max =  2;
	global.no_enemy_max = 2;
	global.arrow_max =	  1;
	global.camera_max =	  2;
	global.invis_max =	  2;	
	
	instance_destroy(obj_menu);
	var inst = instance_create_layer(0, 0, "Instances", obj_menu);
	inst.page = 6;
	inst.logo_y = -16;
}