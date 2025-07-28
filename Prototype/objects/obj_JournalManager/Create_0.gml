clues = ds_list_create();	// contains sprite and coordinates
journal_open = false;
current_page = 0;

right_arrow = {x: 1745, y: 560};
left_arrow = {x: 990, y: 560};

// Add the first clue for Puzzle 1
ds_list_add(clues, {id: "NumberClue", sprite: TutPuzzleKey, x: 1380, y: 570});
array_push(global.level_1_clues, "NumberClue");

// Check if clue already exists
clue_exists = function(_id) {
	for (var i = 0; i < ds_list_size(clues); i++) {
		var c = clues[| i];
		if (c.id == _id) {
			return true;
		}
	}
	return false;
};

// Add a clue to the list
add_clue = function(_id, _sprite, _x, _y) {
	if (!clue_exists(_id)) {
		var new_clue = {
			id: _id,
			sprite: _sprite,
			x: _x,
			y: _y
		};
	
		ds_list_add(clues, new_clue);
	
		// Put collected clue in its level clue array
		if (room == rm_Stage1) {
			array_push(global.level_1_clues, _id);
		}
		else if (room == rm_Stage2) {
			array_push(global.level_2_clues, _id);
		}
		else if (room == rm_Stage3) {
			array_push(global.level_3_clues, _id);
		}
		else if (room == rm_Stage4) {
			array_push(global.level_4_clues, _id);
		}
	}
};

// Remove a clue by id
journal_remove_clue_by_id = function(_id) {
	for (var i = 0; i < ds_list_size(clues); i++) {
		var c = ds_list_find_value(clues, i);
		if (c.id == _id) {
			ds_list_delete(clues, i);
			current_page = 0;
			break;
		}
	}
};

// Draw journal on gui
journal_draw_gui = function() {
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
};
