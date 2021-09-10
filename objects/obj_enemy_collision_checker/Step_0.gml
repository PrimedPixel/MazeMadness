/// @desc
if instance_exists(obj_enemy)
{
	for (var i = 0; i < global.enemy_max; i++)
	{
		with global.enemy[i]
		{
			var other_enemy = instance_place(x, y, obj_enemy)

			if other_enemy
			{
				if global.enemy[i].inst = obj_player_1
				{
					other_enemy.inst = obj_player_2;
					other_enemy.alarm[0] = 300;
				}
				else
				{
					other_enemy.inst = obj_player_1;
					other_enemy.alarm[0] = 300;
				}
			}
		}
	}
}