// Process button clicks
if (paused && mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Resume game
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
		paused = false;
		
		instance_activate_all();
		
		if (surface_exists(pause_surface)) {
			surface_free(pause_surface);
		}
		
		if (buffer_exists(pause_surf_buffer)) {
			buffer_delete(pause_surf_buffer);
		}
		
		// Clear journal
		with (obj_JournalManager) {
			ds_list_clear(clues);
			
			// Add the first clue for Puzzle 1
			ds_list_add(clues, {id: "NumberClue", sprite: TutPuzzleKey, x: 1380, y: 570});
			array_push(global.level_1_clues, "NumberClue");
			
			current_page = 0;
			journal_open = false;
		}
		
		// Remove journal icon
		if (instance_exists(obj_JournalIconGUI)) {
			obj_JournalIconGUI.is_visible = false;
		}
		
		// Reset flags
		global.puzzle_active = false;
		global.prop = false;
		
		// Reset to first gameplay room
		room_goto(rm_Stage1);
	}
	
	// Quit game
	if (point_in_rectangle(mx, my, btn_quit.x, btn_quit.y, btn_quit.x + btn_quit.w, btn_quit.y + btn_quit.h)) {
		game_end();
	}
}