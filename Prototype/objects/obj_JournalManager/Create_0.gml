clues = ds_list_create();	// contains sprite and coordinates
journal_open = false;
current_page = 0;

right_arrow = {x: 1780, y: 540};
left_arrow = {x: 950, y: 540};

// Add the first clue for Puzzle 1
ds_list_add(clues, {id: "NumberClue", sprite: TutPuzzleKey, x: 1380, y: 570});
array_push(global.clues_collected, "NumberClue");

// Add a clue to the list
add_clue = function(_id, _sprite, _x, _y) {
	//if (!array_contains_id(global.clues_collected, _id)) {
		var new_clue = {
			id: _id,
			sprite: _sprite,
			x: _x,
			y: _y
		};
	
		ds_list_add(clues, new_clue);
		
		array_push(global.clues_collected, _id);
		
		
		// play audio effect
		// audio_play_sound(* sound effect file *, 1, false);
	//}
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
}
