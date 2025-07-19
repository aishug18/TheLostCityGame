if (place_meeting(x, y, obj_Player) && !died) {
	died = true;
	with (obj_Player) {
		die();	// only call this once
	}
}