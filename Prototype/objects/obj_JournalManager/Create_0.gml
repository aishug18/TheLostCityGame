clues = ds_list_create();	// contains sprite and coordinates
journal_open = false;
current_page = 0;

right_arrow = {x: 1780, y: 540};
left_arrow = {x: 950, y: 540};

// Add the first clue for Puzzle 1
ds_list_add(clues, {id: "NumberClue", sprite: TutPuzzleKey, x: 1380, y: 570});
array_push(global.level_1_clues, "NumberClue");

// Check if clue already exists
clue_exists = function(_id) {
	for (var i = 0; i < ds_list_size(clues); i++) {
		var c = clues[| i];
		if (c.id == _id) {
			return true;
		}
	}
	return false;
};

// Add a clue to the list
add_clue = function(_id, _sprite, _x, _y) {
	if (!clue_exists(_id)) {
		var new_clue = {
			id: _id,
			sprite: _sprite,
			x: _x,
			y: _y
		};
	
		ds_list_add(clues, new_clue);
	
		// Put collected clue in its level clue array
		if (room == rm_Stage1) {
			array_push(global.level_1_clues, _id);
		}
		else if (room == rm_Stage2) {
			array_push(global.level_2_clues, _id);
		}
		else if (room == rm_Stage3) {
			array_push(global.level_3_clues, _id);
		}
		else if (room == rm_Stage4) {
			array_push(global.level_4_clues, _id);
		}
	
		// play audio effect
		// audio_play_sound(* sound effect file *, 1, false);
	}
};

// Remove a clue by id
journal_remove_clue_by_id = function(_id) {
	for (var i = 0; i < ds_list_size(clues); i++) {
		var c = ds_list_find_value(clues, i);
		if (c.id == _id) {
			ds_list_delete(clues, i);
			break;
		}
	}
};
