// Check if option is selected
for (var i = 0; i < 4; i++) {
    var btn_x = 500;
    var btn_y = 160 + i * 60;

    if (mouse_check_button_pressed(mb_left) &&
        point_in_rectangle(btn_x, btn_y, btn_x + 300, btn_y + 40, mouse_x, mouse_y)) {
        selected_index = i;
    }
}

// Next button
if (answered_correct && show_next_button &&
		mouse_check_button_pressed(mb_left) &&
		point_in_rectangle(500, 550, 800, 590, mouse_x, mouse_y)) {

    current_question++;
    selected_index = -1;
    answered_correct = false;
    show_next_button = false;

    if (current_question >= array_length(question_data)) {
		draw_set_color(c_white);
		draw_text(700, 480, "You answered all questions correctly!");
		
		if(draw_continue_button(860, 520)) {
			room_goto(rm_MainLevel);
		}
    }
}