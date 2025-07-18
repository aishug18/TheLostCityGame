puzzle_solved = false;

current_round = 0;	// Tracks which round we're on (0-2)
total_rounds = 3;
puzzle_finished = false;	// True if all 3 rounds are completed

round_complete_sprites = [
	Pu2_C_Ex,
	Pu2_P_Ex,
	Pu2_S_Ex
];


// Spawns the correct pieces for each round
run_round = function(index) {
	// Remove all existing pieces when starting a new round
	with(obj_Puzzle2Piece) {
		instance_destroy();
	}
	
	var layout = get_round_layout(index);	// contains sprite, offset_x, offset_y
	
	// For each piece, create it at a start position (x, y) and assign the correct location that the player needs to move it to
	for (var i = 0; i < array_length(layout); i++) {
		var piece = spawn_puzzle_piece(
			layout[i].x,
			layout[i].y,
			layout[i].sprite, 
			layout[i].offset_x,
			layout[i].offset_y,
			layout[i].is_anchor,
			layout[i].is_main_anchor);
	}
};

run_round(current_round);	// Start the first round

// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	var anchor = noone;
	with (obj_Puzzle2Piece) {
	    if (is_main_anchor) {
	        anchor = id;
	    }
	}
	
	// Compare each piece's actual offset to its expected offset
	var all_correct = true;
	with (obj_Puzzle2Piece) {
		if (!is_anchor) {
			var expected_x = anchor.x + offset_x;
			var expected_y = anchor.y + offset_y;

			if (point_distance(x, y, expected_x, expected_y) > 15) {
				all_correct = false;
			}
		}
	}
	
	if (all_correct) {
		puzzle_solved = true;
	}
};

// Draw puzzle
draw_puzzle = function () {
	if (puzzle_solved && !puzzle_finished) {
		// Hide the pieces
		with (obj_Puzzle2Piece) {
			visible = false;
		}
		
		// Draw the completed object in the center
		var full_sprite = round_complete_sprites[current_round];
		draw_sprite(full_sprite, 0, display_get_gui_width() / 2, display_get_gui_height() / 2);
		
		draw_text(1500, 750, "Click anywhere to go to the next round");
		
		if (mouse_check_button_pressed(mb_left)) {
			if (current_round < total_rounds - 1) {	// More rounds to go
				current_round++;
				puzzle_solved = false;
				run_round(current_round);
			}
			else {	// Last round is finished
				puzzle_finished = true;
			}
		}
	}
	else if (puzzle_finished) {
		draw_set_color(c_white);
		draw_text(700, 480, is_undefined(victory_message) ? "Puzzle Solved!" : victory_message);
		
		if(draw_continue_button(860, 520)) {
			solve_puzzle();
		}
	}
	else {	// Draw puzzle
		var line_1 = "Welcome to the next puzzle!";
		
		var line_2 = "The goal is to put together all of the broken";
		var line_3 = "pieces to form an artifact, one that is important";
		var line_4 = "to the Mayan culture.";
		
		var line_5 = "One piece is the \"anchor\" piece, meaning you";
		var line_6 = "can't move it. Click and drag the other pieces to";
		var line_7 = "move them, and place them around the anchor piece.";
		
		var line_8 = "Once you place all pieces in their correct";
		var line_9 = "position, the artifact will be restored!";
		
		draw_set_color(c_white);
		draw_text(100, 140, line_1);
		
		draw_text(100, 180, line_2);
		draw_text(100, 210, line_3);
		draw_text(100, 240, line_4);
		
		draw_text(100, 280, line_5);
		draw_text(100, 310, line_6);
		draw_text(100, 340, line_7);
		
		draw_text(100, 380, line_8);
		draw_text(100, 410, line_9);

		with (obj_Puzzle2Piece) {	// loop over every instance of obj_Puzzle2Piece
			// Draw canvas
			draw_set_color(make_color_rgb(30, 30, 30));
			draw_rectangle(box_left, box_top, box_right, box_bottom, false); // filled
		}
		
		with (obj_Puzzle2Piece) {
			draw_sprite(sprite_index, 0, x, y);
		}
			
	}
};

// Puzzle is solved, so trigger something
solve_puzzle = function() {
	// Clean up and trigger external action
	global.puzzle_active = false;
	
	with(obj_PuzzleManager) {
		current_puzzle = noone;
	}
	
	// Spawn portal
	instance_create_layer(672, 480, "Instances", obj_Portal);
	
	// Destroy the puzzle after it's solved
	instance_destroy();
};