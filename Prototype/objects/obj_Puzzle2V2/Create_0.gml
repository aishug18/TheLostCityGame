puzzle_solved = false;
confetti = false;

current_round = 0;	// Tracks which round we're on (0-2)
total_rounds = 3;
puzzle_finished = false;	// True if all 3 rounds are completed

round_complete_sprites = [
	Pu2_C_Ex,
	Pu2_P_Ex,
	Pu2_S_Ex
];

// Help
help_btn = {x: 95, y: 985, sprite: Help_spr };
help_instr = {x: 412, y: 128, sprite: Puzzle2_Instr };
back_btn = {x: 790, y: 480, sprite: BackBtn_spr };
help = false;	// true if help icon is clicked

// Spawns the correct pieces for each round
run_round = function(index) {
	// Remove all existing pieces when starting a new round
	with(obj_Puzzle2PieceV2) {
		instance_destroy();
	}
	
	var layout = get_round_layout_v2(index);	// contains sprite, offset_x, offset_y
	
	// For each piece, create it at a start position (x, y) and assign the correct location that the player needs to move it to
	for (var i = 0; i < array_length(layout); i++) {
		var piece = spawn_puzzle_piece_v2(
			layout[i].x,
			layout[i].y,
			layout[i].sprite, 
			layout[i].offset_x,
			layout[i].offset_y,
			layout[i].is_anchor);
	}
};

run_round(current_round);	// Start the first round

// Run puzzle
run_puzzle = function () {
	// Check if puzzle is finished to play confetti
	if (!puzzle_finished && confetti) {	// Flags to ensure alarm gets called once
		puzzle_finished = true;
		alarm[0] = 60;
	}
	
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Check if help icon is clicked
	if (mouse_check_button_pressed(mb_left) && point_in_circle(mx, my, help_btn.x, help_btn.y, 54)) {
		help = true;
	}
	
	// Check if back button is clicked when help is shown
	if (mouse_check_button_pressed(mb_left) && help && 
		point_in_rectangle(mx, my, back_btn.x, back_btn.y, back_btn.x + sprite_get_width(back_btn.sprite), back_btn.y + sprite_get_height(back_btn.sprite))) {
		
		help = false;
	}
	
	var anchor = noone;
	with (obj_Puzzle2PieceV2) {
	    if (is_anchor) {
	        anchor = id;
	    }
	}
	
	// Compare each piece's actual offset to its expected offset
	var all_correct = true;
	with (obj_Puzzle2PieceV2) {
		var expected_x = anchor.x + offset_x;
		var expected_y = anchor.y + offset_y;

		if (point_distance(x, y, expected_x, expected_y) > 20) {
			all_correct = false;
		}
	}
	
	if (all_correct) {
		puzzle_solved = true;
	}
};

// Draw puzzle
draw_puzzle = function () {
	if (confetti) {
		draw_sprite(ConfettiWin_spr, -1, 0, 0);
	}
	else if (puzzle_solved && !puzzle_finished) {
		// Hide the pieces
		with (obj_Puzzle2PieceV2) {
			visible = false;
		}
		
		// Draw the completed object in the center
		var full_sprite = round_complete_sprites[current_round];
		draw_sprite(full_sprite, 0, display_get_gui_width() / 2, display_get_gui_height() / 2);
		
		// Draw help button
		draw_sprite(help_btn.sprite, 0, help_btn.x, help_btn.y);
		
		if (mouse_check_button_pressed(mb_left)) {
			if (current_round < total_rounds - 1) {	// More rounds to go
				current_round++;
				puzzle_solved = false;
				run_round(current_round);
			}
			else {	// Last round is finished
				confetti = true;	// puzzle_finished
			}
		}
	}
	else {	// Draw puzzle
		with (obj_Puzzle2PieceV2) {
			draw_sprite(sprite_index, 0, x, y);
		}
		
		// Draw help button
		draw_sprite(help_btn.sprite, 0, help_btn.x, help_btn.y);
			
	}
	
	if (help) {
		// Background
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_rectangle(0, 0, 1920, 1080, false);
		draw_set_alpha(1);
			
		draw_sprite(help_instr.sprite, 0, help_instr.x, help_instr.y);
		draw_sprite(back_btn.sprite, 0, back_btn.x, back_btn.y);
	}
};