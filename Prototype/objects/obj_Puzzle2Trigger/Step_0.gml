// Enter puzzle 2 if player is close to the trigger object and presses the Enter key.

if (in_range() && keyboard_check_pressed(vk_enter)) {
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
}