// If player is close enough and presses E, collect the clue and destroy it
if (in_range() && keyboard_check_pressed(ord("E"))) {
	with (obj_JournalManager) {
		add_clue(other.sprite, other._x, other._y);
	}
	
	instance_destroy();
}