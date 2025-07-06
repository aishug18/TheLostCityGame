current_question = 0;
question_data = [
	{
		text: "What is the value of the following Mayan number?",
		options: [
			{ is_sprite: false, value: "3" },
			{ is_sprite: false, value: "6" },
			{ is_sprite: false, value: "12" },
			{ is_sprite: false, value: "9" }
		],
		correct_index: 2
	},
	{
		text: "What is the Mayan symbol for the number 1?",
		options: [
			{ is_sprite: true, value: spr_Option1 },
			{ is_sprite: true, value: spr_Option2 },
			{ is_sprite: true, value: spr_Option3 },
			{ is_sprite: true, value: spr_Option4 }
		],
		correct_index: 3
	},
];

selected_index = -1;
answered_correct = false;
show_next_button = false;
	



/* old stuff
// Puzzle state stuff
puzzle_solved = false;

// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	// do stuff to run puzzle
	
	// Check if Escape is pressed to exit puzzle
	if (keyboard_check_pressed(vk_escape)) {
		global.puzzle_active = false;
	
		with(obj_PuzzleManager) {
			current_puzzle = noone;
		}
		
		// Destroy the puzzle
		instance_destroy();
	}
	
	
};

// Draw puzzle
draw_puzzle = function () {
	// draw puzzle
};

// Puzzle is solved, so trigger something
solve_puzzle = function() {
	global.puzzle_active = false;
	
	with(obj_PuzzleManager) {
		current_puzzle = noone;
	}
	
	// Trigger something, like a door to open
	if (!is_undefined(trigger_action)) {
		trigger_action();	// run the passed-in function
	}
	
	// Destroy the puzzle after it's solved
	instance_destroy();
}; */