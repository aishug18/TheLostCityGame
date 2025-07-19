if (place_meeting(x, y, obj_Player)) {
	with (obj_JournalManager) {
		add_clue(other._id, other.sprite, other._x, other._y);
	}
	array_push(global.level_1_clues, _id);
	
	instance_destroy();
}