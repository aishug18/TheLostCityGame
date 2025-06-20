function draw_dialogue_box(message) {
	var box_width = 250;
	var padding = 10;	// Padding between text and box border
	var text_width = box_width - (padding * 2);
	var line_spacing = 15;	// Spacing between lines
	
	var text_height = string_height_ext(message, line_spacing, text_width);
	var box_height = text_height + (padding * 2);
	
	var box_x1 = x - box_width / 2
	var box_y1 = y - (sprite_height / 2) - box_height - 10;
	var box_x2 = x + box_width / 2;
	var box_y2 = box_y1 + box_height;
	
	// Draw box
	draw_set_color(c_white);
	draw_set_alpha(0.7);
	draw_rectangle(box_x1, box_y1,  box_x2,  box_y2, false);
	
	// Draw text
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_text_ext(box_x1 + padding, box_y1 + padding, message, line_spacing, text_width);
}