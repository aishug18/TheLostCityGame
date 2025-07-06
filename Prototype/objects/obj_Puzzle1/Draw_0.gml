var question = question_data[current_question];

// Draw journal
draw_sprite(spr_JournalPage, 0, 100, 100);

// Draw question text
draw_text(500, 100, question.text);

// Draw options
for (var i = 0; i < 4; i++) {
	var opt = question.options[i];
	
	var btn_x = 500;
    var btn_y = 160 + i * 60;
    
    var color = (i == selected_index) ? c_lime : c_white;
    draw_set_color(color);
    draw_rectangle(btn_x, btn_y, btn_x + 300, btn_y + 40, false);
	draw_set_color(c_black);
	
	if (opt.is_sprite) {
		var spr = asset_get_index(opt.value);
		draw_sprite(spr, 0, btn_x + 10, btn_y + 10);
	} else {
		draw_text(btn_x + 10, btn_y + 10, opt.value);
	}
}

// Draw submit button
if (selected_index != -1 && !answered_correct) {
    draw_set_color(c_white);
	draw_rectangle(500, 420, 800, 460, false);
	draw_set_color(c_black);
    draw_text(510, 430, "Submit");
}

// Feedback
if (answered_correct) {
	draw_set_color(c_black);
    draw_text(500, 500, "Correct!");
    
    if (show_next_button) {
		draw_set_color(c_white);
        draw_rectangle(500, 550, 800, 590, false);
		draw_set_color(c_black);
        draw_text(520, 560, "Next");
    }
}
else if (selected_index != -1 && mouse_check_button_pressed(mb_left) && point_in_rectangle(500, 420, 800, 460, mouse_x, mouse_y)) {
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