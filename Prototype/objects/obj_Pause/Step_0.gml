// Process button clicks
if (paused && mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Resume game
	if (point_in_rectangle(mx, my, btn_resume.x1, btn_resume.y1, btn_resume.x2, btn_resume.y2)) {
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
	if (point_in_rectangle(mx, my, btn_restart.x1, btn_restart.y1, btn_restart.x2, btn_restart.y2)) {	
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
	
	// Show how to play screen
	if (point_in_rectangle(mx, my, btn_howtoplay.x1, btn_howtoplay.y1, btn_howtoplay.x2, btn_howtoplay.y2)) {
		how_to_play = true;
	}
	
	// Quit game
	if (point_in_rectangle(mx, my, btn_quit.x1, btn_quit.y1, btn_quit.x2, btn_quit.y2)) {
		game_end();
	}
	
	// Go back to pause from how to play
	if (how_to_play && point_in_rectangle(mx, my, btn_back.x, btn_back.y, btn_back.x + sprite_get_width(btn_back.sprite), btn_back.y + sprite_get_height(btn_back.sprite))) {
		how_to_play = false;
	}
}