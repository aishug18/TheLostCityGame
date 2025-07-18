// Toggle journal with Q
if (keyboard_check_pressed(ord("E")) && is_visible) {
	with (obj_JournalManager) {
		journal_open = !journal_open;
	}
}

// Or if click over icon
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
if (mouse_check_button_pressed(mb_left) && is_visible) {
	if (point_in_rectangle(mx, my, icon_x - 75, icon_y - 75, icon_x + 75, icon_y + 75)) {
		with (obj_JournalManager) {
			journal_open = !journal_open;
		}
	}
}