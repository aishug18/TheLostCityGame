global.puzzle_active = false;
current_puzzle = noone;	// noone is no instance or null reference

// Draw on gui
puzzle_draw_gui = function() {
	if(global.puzzle_active && current_puzzle != noone) {
		// Dark overlay
		draw_set_alpha(0.9);
		draw_set_color(make_color_rgb(104, 95, 72));	// dark tan
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
		draw_set_alpha(1);
	
		// Let the puzzle draw itself
		with(current_puzzle) {
			draw_puzzle();	// each puzzle implements this
		}
	}
};