if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Quit game
	if (point_in_rectangle(mx, my, btn_quit.x, btn_quit.y, btn_quit.x + btn_quit.w, btn_quit.y + btn_quit.h)) {
		game_end();
	}
}