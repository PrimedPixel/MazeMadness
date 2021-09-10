function Macros()
{
	#macro CELL_WIDTH 32
	#macro CELL_HEIGHT 32
	#macro FLOOR -5
		//#macro WALL -6
	#macro VOID -7

	enum powerup
	{
		speed,
		freeze,
		reverse,
		arrow,
		invisible
	}
	
	enum target_mode
	{
		object_self,
		other_player
	}
}
