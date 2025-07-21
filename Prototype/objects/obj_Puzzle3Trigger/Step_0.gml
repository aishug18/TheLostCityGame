if (place_meeting(x, y, obj_Player)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Objects", obj_Puzzle3);
		
		// Pass in dynamic info
		puzzle.victory_message = "You successfully solved the riddle! The date 13.0.0.0.0, or 4 Ajaw 8 Kumk'u, is the Mayan Creation Date, the start of the current Long Count cycle.";
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
	
	instance_destroy();
}