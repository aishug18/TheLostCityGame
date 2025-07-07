if (!puzzle_solved) {
	var question = question_data[current_question];

	// Draw journal
	draw_sprite(spr_JournalPage, 0, 100, 260);

	// Draw question text
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
	}

	// Feedback
	if (answered_correct) {
		draw_set_color(c_black);
	    draw_text(1200, 500, "Correct!");
    
	    if (show_next_button) {
			draw_set_color(c_white);
	        draw_rectangle(next_btn.x, next_btn.y, next_btn.x + next_btn.w, next_btn.y + next_btn.h, false);
			draw_set_color(c_black);
	        draw_text(next_btn.x + 10, next_btn.y + 10, "Next");
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