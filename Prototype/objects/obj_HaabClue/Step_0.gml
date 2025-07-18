if (place_meeting(x, y, obj_Player)) {
	with (obj_JournalManager) {
		add_clue(other.sprite, other._x, other._y);
	}
	
	instance_destroy();
}