if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Start game
	if (point_in_rectangle(mx, my, button_start.x, button_start.y, button_start.x + button_start.w, button_start.y + button_start.h)) {
		room_goto_next();
	}
	
	// Start game
	if (point_in_rectangle(mx, my, button_quit.x, button_quit.y, button_quit.x + button_quit.w, button_quit.y + button_quit.h)) {
		game_end();
	}
}