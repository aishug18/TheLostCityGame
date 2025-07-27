// Puzzle state and setup

current_question = 0;
question_data = [
	{
		sprite: TutPuzzle16,
		options: [ 
					{ x: 320, y: 466, sprite: MathNum_21 },
					{ x: 312, y: 604, sprite: MathNum_6 },
					{ x: 315, y: 740, sprite: MathNum_16 },
					{ x: 318, y: 881, sprite: MathNum_9 }
		],
		correct_index: 2
	},
	{
		sprite: TutPuzzle73,
		options: [ 
					{ x: 326, y: 464, sprite: MathNum_185 },
					{ x: 323, y: 604, sprite: MathNum_20 },
					{ x: 331, y: 743, sprite: MathNum_18 },
					{ x: 333, y: 880, sprite: MathNum_73 }
		],
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

option_selected = [
	{ x: 242, y: 516 },
	{ x: 242, y: 655 },
	{ x: 242, y: 795 },
	{ x: 242, y: 935 },
];

opt_radius = 40;

submit_btn = { x: 980, y: 910, sprite: SubmitBtn };
next_btn = { x: 980, y: 910, sprite: NextBtn };

// Help
help_btn = {x: 95, y: 985, sprite: Help_spr };
help_instr = {x: 390, y: 95, sprite: Puzzle1_Instr };
back_btn = {x: 790, y: 480, sprite: BackBtn_spr };
help = false;	// true if help icon is clicked

puzzle_solved = false;
confetti = false;
incorrect = false;


// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved to play confetti
	if (!puzzle_solved && confetti) {	// Flags to ensure alarm gets called once
		puzzle_solved = true;
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
	
	// Check if option is selected, either where the text is or the circle
	for (var i = 0; i < 4; i++) {
	    if (mouse_check_button_pressed(mb_left) &&
	        (point_in_rectangle(mx, my, option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h)
			|| point_in_circle(mx, my, option_selected[i].x, option_selected[i].y, opt_radius))) {
	        
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
			confetti = true;	// puzzle is done, play confetti
	    }
	}
};

// Draw puzzle
draw_puzzle = function () {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if (!confetti) {
		var question = question_data[current_question];

		// Draw problem box with question
		draw_sprite(TutorialPuzzleProblemBox, 0, 520, 540);
		
		// Draw question sprite
		draw_sprite(question.sprite, 0, 520, 215);

		// Draw options
		for (var i = 0; i < 4; i++) {
			if (i == selected_index) {
				draw_sprite(TutPuzzle_AnswerDot, 0, option_selected[i].x, option_selected[i].y);
			}
			
			draw_sprite(question.options[i].sprite, 0, question.options[i].x, question.options[i].y);
		}

		// Draw submit button	
		if (selected_index != -1 && !answered_correct) {
			draw_sprite(submit_btn.sprite, 0, submit_btn.x, submit_btn.y);
		}
		
		// Draw help button
		draw_sprite(help_btn.sprite, 0, help_btn.x, help_btn.y);

		// Feedback
		if (answered_correct) {
			draw_sprite(Correct_spr, 0, 450, 857); // or 200x320
    
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
				incorrect = false;
				audio_play_sound(Win_sound, 1, false);
		    }
		    else {
				incorrect = true;
				audio_play_sound(lose_sound, 1, false);
		    }
		}
		if (incorrect) {
			draw_sprite(Incorrect_spr, 0, 460, 865); // or 275x235
			
			if (current_question == 1) {	// on the second round, show explanation
				draw_sprite(TutPuzzle_failEx, 0, 960, 130);
			}
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
	}
	else {
		draw_sprite(ConfettiWin_spr, -1, 0, 0);
	}
};