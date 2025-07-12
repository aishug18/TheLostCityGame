if (in_range() && keyboard_check_pressed(ord("E"))) {
	journal_acquired = true;
	hide_sprite = true;
}

// Start puzzle 1
if (journal_acquired && mouse_check_button_pressed(mb_left)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Instances", obj_Puzzle1);
		
		// Pass in dynamic info
		puzzle.victory_message = "You correctly answered all questions about the Mayan number system!";
		puzzle.target_object = instance_nearest(x, y, obj_Puzzle1Portal);	// or any object
		
		puzzle.trigger_action = function () {
			// What happens when the puzzle is complete
			with (other.target_object) {
				open();	// Portal to new room
			}
		};
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
	
	instance_destroy();
}