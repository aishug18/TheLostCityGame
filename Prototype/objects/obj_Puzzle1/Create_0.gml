// Puzzle state stuff

// Run puzzle
run_puzzle = function () {
	// do stuff to run puzzle
	
	// check if puzzle is solved
	// if ( */puzzle is solved*/ ) {
		solve_puzzle();
	// }
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
	
	// Destroy the puzzle after it's solved
	instance_destroy();
};