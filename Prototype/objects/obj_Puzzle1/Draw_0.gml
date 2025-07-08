if (!puzzle_solved) {
	// Basic information		DELETE THIS EXPLANATION
	draw_set_color(c_black);
	var line_1 = "Welcome to your first puzzle! Puzzles in this game are aimed to teach you about Mayan culture and history. Solve a puzzle and you not only move on, but you get to learn about Mayan history.";
	var line_2 = "You must solve each puzzle before moving on. After all, learning about the past is the best way to create a better present and future.";
	var line_3 = "For this puzzle, you must answer questions about the Mayan number system. But wait, you don't know the Mayan number system!";
	var line_4 = "That's what your journal is for. Open your journal and find the \"Mayan Number System\" page. Using this page, answer the questions correctly.";
	var line_5 = "If you answer all of the questions right, your journal will get another page filled with all of the information you could possibly have about the Mayan number system.";
	var line_6 = "Happy history-hunting!";
	
	draw_text(100, 50, line_1);
	draw_text(100, 80, line_2);
	draw_text(100, 110, line_3);
	draw_text(100, 140, line_4);
	draw_text(100, 170, line_5);
	draw_text(100, 200, line_6);
	
	var question = question_data[current_question];



	//Draw Mayan Numbers Explanation Sprite
	//This should be the first thing to appear on the screen after the player
	//picks up the journal
	//draw_sprite(TutPuzzleIntro, 0, 600, 0);




	// Draw journal
	draw_sprite(spr_JournalPage, 0, 100, 300);
	
	
	
	
	//Draw KEY
	draw_sprite(TutPuzzleKey, 0, 100, 300);
	//Draw Questions and Problem Sprite
	draw_sprite(TutorialPuzzleProblemBox, 0, 800, 10);



	// Draw question text	DELETE?
	draw_text(800, 300, question.text);

	// Draw options
	for (var i = 0; i < 4; i++) {
	    var color = (i == selected_index) ? c_lime : c_black;
	    draw_set_color(color);
		draw_rectangle(option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h, true);	// outline
		draw_set_color(c_white);
	    draw_rectangle(option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h, false);	// filled
		draw_set_color(c_black);
		draw_text(option_btns[i].x + 10, option_btns[i].y + 10, question.options[i]);
	}

	// Draw submit button	
	if (selected_index != -1 && !answered_correct) {
	    draw_set_color(c_white);
		draw_rectangle(submit_btn.x, submit_btn.y, submit_btn.x + submit_btn.w, submit_btn.y + submit_btn.h, false);
		draw_set_color(c_black);
	    draw_text(submit_btn.x + 10, submit_btn.y + 10, "Submit");
		//DELETE? ^
		
		
		//Draw sprite Submit btn
		draw_sprite(SubmitBtn, 0,1500, 900);
	}

	// Feedback
	if (answered_correct) {
		draw_set_color(c_black);
	    draw_text(1200, 500, "Correct!");///Show next to the answer
    
	    if (show_next_button) {
			draw_set_color(c_white);
	        draw_rectangle(next_btn.x, next_btn.y, next_btn.x + next_btn.w, next_btn.y + next_btn.h, false);
			draw_set_color(c_black);
	        draw_text(next_btn.x + 10, next_btn.y + 10, "Next");
			//DELETE?^^^
			
			//Draw Next Sprite
			draw_sprite(NextBtn, 0,1500, 900);
			
	    }
	}
	else if (selected_index != -1 && mouse_check_button_pressed(mb_left) && 
				point_in_rectangle(mouse_x, mouse_y, submit_btn.x, submit_btn.y, submit_btn.x + submit_btn.w, submit_btn.y + submit_btn.h)) {
    
		// Submit clicked
	    if (selected_index == question_data[current_question].correct_index) {
	        answered_correct = true;
	        show_next_button = true;
	    }
	    else {
	        show_message("Incorrect. Try again.");
	        selected_index = -1;
	    }
	}
}
else {
	draw_set_color(c_black);
	draw_text(800, 480, "You answered all questions correctly!");
	
	if(draw_continue_button(860, 520)) {
		room_goto_next();
	}
}