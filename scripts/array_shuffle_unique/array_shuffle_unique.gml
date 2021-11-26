// Shuffles an array in such a way that no previous index will be in the same place
/// @desc array_shuffle_unique(array)
/// @args array
//  Returns: newly shuffled array
function array_shuffle_unique(array)
{
	var array_new;
	
	//Create an array of available indexes to use
	var available_indexes;
	
	var len = array_length(array) - 1;
	for (var i = 0; i <= len; i++)
	{
		available_indexes[i] = i;
	}
	
	for (i = 0; i <= len; i++)
	{
		//Assign an element to the new array, deleting the value from the list of indexes
		counter = 0;
		do
		{
			var available_indexes_index = irandom(array_length(available_indexes) - 1);
			var index = available_indexes[available_indexes_index];
			counter++;
		}
		until index != i || counter >= 100;	//arbitrary value; used only to stop infinite looping, but is mathematically unfeasable to be the case
	
		array_delete(available_indexes, available_indexes_index, 1);
		array_new[index] = array[i];
	}
	
	return array_new;
}