// Player collides with trigger and clicks to dismiss the Mayan numbers explanation, so start puzzle
if (place_meeting(x, y, obj_Player) && mouse_check_button_pressed(mb_left)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Puzzle", obj_Puzzle1);
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
	
	instance_destroy();
}