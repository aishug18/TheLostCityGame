// Puzzle state stuff
var center_x = 960;
var center_y = 540;

puzzle_solved = false;

current_round = 0;	// Tracks which round we're on (0-2)
total_rounds = 3;
next = false;	// Let's you show "Next" button

round_data = array_create(3);	// optional: preload data, can store layouts per round if needed

round_complete_sprites = [
	spr_Object0,
	spr_Object1,
	spr_Object2
];

// Spawns the correct pieces for each round
run_round = function(index) {
	// Remove all existing pieces when starting a new round
	with(obj_Puzzle2Piece) {
		instance_destroy();
	}
	
	var layout = get_round_layout(index);	// Fetch an array of piece data from a function
	
	// For each piece, create it at a start position (x, y) and assign the correct location that the player needs to move it to
	for (var i = 0; i < array_length(layout); i++) {
		var piece = instance_create_layer(layout[i].x, layout[i].y, "Instances", obj_Puzzle2Piece);
		piece.correct_x = layout[i].correct_x;
		piece.correct_y = layout[i].correct_y;
		piece.sprite_index = layout[i].sprite;	// assign the image
	}
};

run_round(current_round);	// Start the first round

// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	// Check if all pieces are close to their target (within 10 pixels)
	var all_correct = true;
	with (obj_Puzzle2Piece) {
		if (point_distance(x, y, correct_x, correct_y) > 10) {
			all_correct = false;
		}
	}
	
	if (all_correct) {
		puzzle_solved = true;
	}
	
	
	// Check if Escape is pressed to exit puzzle
	if (keyboard_check_pressed(vk_escape)) {
		global.puzzle_active = false;
	
		with(obj_PuzzleManager) {
			current_puzzle = noone;
		}
		
		// Destroy the puzzle
		instance_destroy();
	}
};

// Draw puzzle
draw_puzzle = function () {
	if (puzzle_solved) {
		// Hide the pieces
		with (obj_Puzzle2Piece) {
			visible = false;
		}
		
		// Draw the completed object in the center
		var full_sprite = round_complete_sprites[current_round];
		draw_sprite(full_sprite, 0, display_get_gui_width() / 2, display_get_gui_height() / 2);
		
		// Draw message box
		draw_set_color(c_white);
		draw_text(600, 700, "You reassembled the ancient mask...");
		
		if (current_round < total_rounds - 1) {	// More rounds to go, so show Next button
			draw_rectangle(800, 600, 1120, 660, false);
			draw_set_color(c_black);
			draw_text(880, 620, "Next");
			
			// When clicked, increment the round and spawn new pieces
			if (mouse_check_button_pressed(mb_left)) {
				current_round++;
				puzzle_solved = false;
				run_round(current_round);
			}
		}
		else {	// Final round -> show victory
			draw_set_color(c_white);
			draw_text(700, 480, is_undefined(victory_message) ? "Puzzle Solved!" : victory_message);
		
			if(draw_continue_button(860, 520)) {
				solve_puzzle();
			}
		}
	}
	else {	// Draw puzzle
		with (obj_Puzzle2Piece) {	// loop over every instance of obj_Puzzle2Piece
			// Draw puzzle canvas background
			draw_set_color(make_color_rgb(30, 30, 30)); // dark background
			draw_rectangle(box_left, box_top, box_right, box_bottom, false); // outline

			// Optional: translucent fill to show it's a container
			draw_set_alpha(0.2);
			draw_set_color(c_white);
			draw_rectangle(box_left, box_top, box_right, box_bottom, true); // filled
			draw_set_alpha(1);
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
	
	// Trigger something, like a door to open
	if (!is_undefined(trigger_action)) {
		trigger_action();	// run the passed-in function
	}
	
	// Destroy the puzzle after it's solved
	instance_destroy();
};