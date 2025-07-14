// Enter puzzle 3 if player is close to the trigger object and presses the Enter key.

if (in_range() && keyboard_check_pressed(vk_enter)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Instances", obj_Puzzle3);
		
		// Pass in dynamic info
		puzzle.victory_message = "You successfully solved the riddle and unlocked the vault! The date 13.0.0.0.0, or 4 Ajaw 8 Kumk'u, is the Mayan Creation Date, the start of the current Long Count cycle.";
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
}