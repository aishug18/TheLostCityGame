// Check if option is selected
for (var i = 0; i < 4; i++) {
    if (mouse_check_button_pressed(mb_left) &&
        point_in_rectangle(mouse_x, mouse_y, option_btns[i].x, option_btns[i].y, option_btns[i].x + opt_btn_w, option_btns[i].y + opt_btn_h)) {
        selected_index = i;
    }
}

// Next button
if (answered_correct && show_next_button &&
		mouse_check_button_pressed(mb_left) &&
		point_in_rectangle(mouse_x, mouse_y, next_btn.x, next_btn.y, next_btn.x + next_btn.w, next_btn.y + next_btn.h)) {
	
	current_question++;
    selected_index = -1;
    answered_correct = false;
    show_next_button = false;

    if (current_question >= array_length(question_data)) {
		puzzle_solved = true;
    }
}