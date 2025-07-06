current_question = 0;
question_data = [
	{
		text: "What is the value of the following Mayan number?",
		options: ["3", "6", "12", "9"],
		correct_index: 2
	},
	{
		text: "What is the Mayan symbol for the number 1?",
		options: ["2 circles and 1 bar", "1 bar", "3 circles and 1 bar", "1 circle"],
		correct_index: 3
	},
];

selected_index = -1;
answered_correct = false;
show_next_button = false;

opt_btn_w = 300;
opt_btn_h = 70;

option_btns = [
	{ btn_x: 800, btn_y: 400 },
	{ btn_x: 800, btn_y: 475 },
	{ btn_x: 800, btn_y: 550 },
	{ btn_x: 800, btn_y: 625 },
];

submit_btn = { btn_x: 1200, btn_y: 630, w: 200, h: 60 };

next_btn = { btn_x: 1200, btn_y: 630, w: 200, h: 60 };

puzzle_solved = false;

	



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