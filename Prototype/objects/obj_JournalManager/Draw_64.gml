// Draw journal page if opened
if (journal_open) {
	// Darken background
	draw_set_color(make_color_rgb(104, 95, 72));	// dark tan
	draw_set_alpha(0.6);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
	// Draw journal page to the right
	draw_sprite(Journal_spr, 0, 1360, 530);
	
	// Draw current page content
	if (ds_list_size(clues) > 0) {
		var page = clues[| current_page];
		draw_sprite(page.sprite, 0, page.x, page.y);
	}
	
	// Draw arrows
	draw_sprite(JournalArrow_spr, 0, right_arrow.x, right_arrow.y);	// right arrow, normal
	draw_sprite_ext(JournalArrow_spr, 0, left_arrow.x, left_arrow.y, image_xscale * -1, image_yscale, image_angle, image_blend, image_alpha);	// left arrow, flipped
	
	// Draw page count (optional but seems useful)
	draw_set_color(make_color_rgb(40, 30, 20));	// dark brown
	draw_text(1500, 200, string(current_page + 1) + " / " + string(ds_list_size(clues)));
}