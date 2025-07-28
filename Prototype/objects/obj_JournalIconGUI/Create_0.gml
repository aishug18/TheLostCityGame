icon_x = 1790;
icon_y = 940;
is_visible = false;

// Draw journal icon on gui
journal_icon_draw_gui = function() {
	// Draw only after picking up the icon
	if (is_visible) {
		draw_sprite(spr_JournalIcon, 0, icon_x, icon_y);
	}
};