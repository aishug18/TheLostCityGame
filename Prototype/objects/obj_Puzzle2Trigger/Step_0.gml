if (place_meeting(x, y, obj_Player)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Instances", obj_Puzzle2);
		
		// Pass in dynamic info
		puzzle.victory_message = "You successfully restored all artifacts and opened the door!";
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
	
	instance_destroy();
}