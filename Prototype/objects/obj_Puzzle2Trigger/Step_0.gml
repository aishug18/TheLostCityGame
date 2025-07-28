if (place_meeting(x, y, obj_Player)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Puzzle", obj_Puzzle2V2);
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
	
	instance_destroy();
}