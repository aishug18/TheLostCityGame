// Reset per-level state
for (var i = 0; i < array_length(global.level_clues); i++) {
	var _id = global.level_clues[i];
	
	// Remove clue from journal
	with (obj_JournalManager) {
		journal_remove_clue_by_id(_id);
	}
}

global.level_clues = [];

// Restart room
room_restart();