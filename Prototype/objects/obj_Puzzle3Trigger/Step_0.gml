// Enter puzzle 3 if player is close to the trigger object and presses the Enter key.

if (in_range() && keyboard_check_pressed(vk_enter)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Instances", obj_Puzzle3);
		
		// Pass in dynamic info
		puzzle.victory_message = "You successfully solved the riddle and unlocked the vault!";
		puzzle.target_object = instance_nearest(x, y, obj_Puzzle3Door);	// or any object
		
		puzzle.trigger_action = function () {
			// What happens when the puzzle is complete
			with (other.target_object) {
				open();	// This could a be a function on a door, NPC, etc.
			}
			
			// Destroy the trigger after puzzle completion
			instance_destroy(inst_6AD50C4A);
		};
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
}