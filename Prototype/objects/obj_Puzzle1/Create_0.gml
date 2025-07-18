// Puzzle state and setup

current_question = 0;
question_data = [
	{
		sprite: TutPuzzle16,
		options: ["21", "6", "16", "9"],
		correct_index: 2
	},
	{
		sprite: TutPuzzle73,
		options: ["185", "20", "18", "73"],
		correct_index: 3
	},
];

selected_index = -1;
answered_correct = false;
show_next_button = false;

opt_btn_w = 480;
opt_btn_h = 80;

option_btns = [
	{ x: 320, y: 480 },
	{ x: 320, y: 620 },
	{ x: 320, y: 760 },
	{ x: 320, y: 900 },
];

submit_btn = { x: 980, y: 910, sprite: SubmitBtn };

next_btn = { x: 980, y: 910, sprite: NextBtn };

puzzle_solved = false;


// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Check if option is selected
	for (var i = 0; i < 4; i++) {
	    if (mouse_check_button_pressed(mb_left) &&
	        point_in_rectangle(mx, my, option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h)) {
	        selected_index = i;
	    }
	}

	// Next button
	if (answered_correct && show_next_button &&
			mouse_check_button_pressed(mb_left) &&
			point_in_rectangle(mx, my, next_btn.x, next_btn.y, next_btn.x + sprite_get_width(next_btn.sprite), next_btn.y + sprite_get_height(next_btn.sprite))) {
	
		current_question++;
	    selected_index = -1;
	    answered_correct = false;
	    show_next_button = false;

	    if (current_question >= array_length(question_data)) {
			puzzle_solved = true;
	    }
	}
};

// Draw puzzle
draw_puzzle = function () {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if (!puzzle_solved) {
		var question = question_data[current_question];

		// Draw problem box with question
		draw_sprite(TutorialPuzzleProblemBox, 0, 520, 540);
		
		// Draw question sprite
		draw_sprite(question.sprite, 0, 520, 215);

		// Draw options
		for (var i = 0; i < 4; i++) {
		    var color = (i == selected_index) ? c_lime : c_black;	// change to fill in bubble
		    draw_set_color(color);
			var alpha = (i == selected_index) ? 1 : 0;
			draw_set_alpha(alpha);
			draw_rectangle(option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h, true);	// outline
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_text(option_btns[i].x + 10, option_btns[i].y + 10, question.options[i]);
		}

		// Draw submit button	
		if (selected_index != -1 && !answered_correct) {
			draw_sprite(submit_btn.sprite, 0, submit_btn.x, submit_btn.y);
		}

		// Feedback
		if (answered_correct) {
			draw_set_color(c_black);
		    draw_text(350, 400, "Correct!");
    
		    if (show_next_button) {
				draw_sprite(next_btn.sprite, 0, next_btn.x, next_btn.y);
		    }
		}
		else if (selected_index != -1 && mouse_check_button_pressed(mb_left) && 
					point_in_rectangle(mx, my, submit_btn.x, submit_btn.y, submit_btn.x + sprite_get_width(submit_btn.sprite), submit_btn.y + sprite_get_height(submit_btn.sprite))) {
    
			// Submit clicked
		    if (selected_index == question_data[current_question].correct_index) {
		        answered_correct = true;
		        show_next_button = true;
		    }
		    else {
		        draw_set_color(c_black);
				draw_text(350, 400, "Incorrect. Try again");	// fix this, disappears too soon
		    }
		}
	}
	else {
		draw_set_color(c_white);
		draw_text(700, 480, is_undefined(victory_message) ? "Puzzle Solved!" : victory_message);
	
		if(draw_continue_button(860, 520)) {
			solve_puzzle();
		}
	}
};

// Puzzle is solved, so trigger portal
solve_puzzle = function() {
	global.puzzle_active = false;
	
	with(obj_PuzzleManager) {
		current_puzzle = noone;
	}
	
	// Spawn portal
	instance_create_layer(1360, 144, "Objects", obj_Portal);
	
	// Destroy the puzzle after it's solved
	instance_destroy();
};