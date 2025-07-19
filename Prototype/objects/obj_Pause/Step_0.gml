// Process button clicks
if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Pause game
	if (point_in_rectangle(mx, my, btn_resume.x, btn_resume.y, btn_resume.x + btn_resume.w, btn_resume.y + btn_resume.h)) {
		paused = false;
		
		instance_activate_all();
		
		if (surface_exists(pause_surface)) {
			surface_free(pause_surface);
		}
		
		if (buffer_exists(pause_surf_buffer)) {
			buffer_delete(pause_surf_buffer);
		}
	}
	
	// Restart game
	if (point_in_rectangle(mx, my, btn_restart.x, btn_restart.y, btn_restart.x + btn_restart.w, btn_restart.y + btn_restart.h)) {
		show_debug_message("restarted game");
		// implement restarting game
	}
	
	// Start game
	if (point_in_rectangle(mx, my, btn_quit.x, btn_quit.y, btn_quit.x + btn_quit.w, btn_quit.y + btn_quit.h)) {
		game_end();
	}
}