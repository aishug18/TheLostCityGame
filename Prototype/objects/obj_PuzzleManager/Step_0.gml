if(global.puzzle_active && current_puzzle != noone) {
	// Let the current puzzle run its logic
	with(current_puzzle) {	// "go inside the instance stored in current_puzzle and run its run_puzzle() function"
		run_puzzle();	// each puzzle implements this
	}
}