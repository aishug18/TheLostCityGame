// Reset collected clues for each level
if (room == rm_Stage1) {
	for (var i = 0; i < array_length(global.level_1_clues); i++) {
		var _id = global.level_1_clues[i];
	
		// Remove clue from journal
		with (obj_JournalManager) {
			journal_remove_clue_by_id(_id);
		}
	}
	
	global.level_1_clues = [];
	
	with (obj_JournalManager) {
		// Add the first clue for Puzzle 1
		ds_list_add(clues, {id: "NumberClue", sprite: TutPuzzleKey, x: 1380, y: 570});
		array_push(global.level_1_clues, "NumberClue");
	}
	
	// Remove journal icon
	if (instance_exists(obj_JournalIconGUI)) {
		obj_JournalIconGUI.is_visible = false;
	}
}
else if (room == rm_Stage2) {
	for (var i = 0; i < array_length(global.level_2_clues); i++) {
		var _id = global.level_2_clues[i];
	
		with (obj_JournalManager) {
			journal_remove_clue_by_id(_id);
		}
	}
	
	global.level_2_clues = [];
}
else if (room == rm_Stage3) {
	for (var i = 0; i < array_length(global.level_3_clues); i++) {
		var _id = global.level_3_clues[i];
	
		with (obj_JournalManager) {
			journal_remove_clue_by_id(_id);
		}
	}
	
	global.level_3_clues = [];
}
else if (room == rm_Stage4) {
	for (var i = 0; i < array_length(global.level_4_clues); i++) {
		var _id = global.level_4_clues[i];
	
		with (obj_JournalManager) {
			journal_remove_clue_by_id(_id);
		}
	}
	
	global.level_4_clues = [];
}

// Reset flags and states
with (obj_JournalManager) {	
	current_page = 0;
	journal_open = false;
}
		
global.puzzle_active = false;
global.prop = false;

with (obj_Trap) {
	died = false;
}

// Restart room
room_restart();