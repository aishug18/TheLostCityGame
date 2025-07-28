if (paused) {
    // Dark background
	draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
	
	if (how_to_play) {
		draw_sprite(HowToPlayTitle_spr, 0, 960, 162);
		draw_sprite(Instr2_spr, 0, 960, 435);
		draw_sprite(Instr3_spr, 0, 960, 697);
		draw_sprite(Instr1_spr, 0, 960, 947);
		
		draw_sprite(btn_back.sprite, 0, btn_back.x, btn_back.y);
	}
	else {
		draw_sprite(spr_Pause, 0, 0, 0);
	}
}