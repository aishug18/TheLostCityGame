// Enter puzzle 1 if player is close to the trigger object and presses the Enter key.

if (in_range() && keyboard_check_pressed(vk_enter)) {
	if (!global.puzzle_active) {
		// Start puzzle
		global.puzzle_active = true;
		
		// Create the puzzle object
		var puzzle = instance_create_layer(x, y, "Instances", obj_Puzzle1);
		
		// Pass in dynamic info
		puzzle.victory_message = "You correctly answered all questions and can start playing!";
		puzzle.target_object = instance_nearest(x, y, obj_Puzzle1Door);	// or any object
		
		puzzle.trigger_action = function () {
			// What happens when the puzzle is complete
			with (other.target_object) {
				open();	// This could a be a function on a door, NPC, etc.
			}
			
			// Destroy the trigger after puzzle completion
			instance_destroy(inst_136FD7F9);
		};
		
		// Store it in the puzzle manager
		with (obj_PuzzleManager) {
			current_puzzle = puzzle;
		}
	}
}