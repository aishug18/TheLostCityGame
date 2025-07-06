if (in_range() && keyboard_check_pressed(ord("E"))) {
	with (obj_StageController) {
		journal_acquired = true;
		alarm[0] = 1.5;	// 1.5 second delay
	}
	instance_destroy();
}