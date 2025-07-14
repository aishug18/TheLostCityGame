clues = ds_list_create();	// contains sprite and coordinates
journal_open = false;
current_page = 0;

right_arrow = {x: 1780, y: 540};
left_arrow = {x: 950, y: 540};

// Add the first clue for Puzzle 1
ds_list_add(clues, {sprite: TutPuzzleKey, x: 1380, y: 570});

// Add a clue to the list
add_clue = function(_sprite, _x, _y) {
	var new_clue = {
		sprite: _sprite,
		x: _x,
		y: _y
	};
	
	ds_list_add(clues, new_clue);
	
	// play audio effect
	// audio_play_sound(* sound effect file *, 1, false);
};
