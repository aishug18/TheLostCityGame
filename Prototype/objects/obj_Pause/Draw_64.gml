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

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width()/2, 300, "PAUSED");
    
	// Buttons
	draw_set_color(c_white);
	draw_rectangle(btn_howtoplay.x, btn_howtoplay.y, btn_howtoplay.x + btn_howtoplay.w, btn_howtoplay.y + btn_howtoplay.h, false);
	
	draw_set_color(c_black);
	draw_text(btn_howtoplay.x + btn_howtoplay.w/2, btn_howtoplay.y + btn_howtoplay.h/2, "How To Play");
	
	draw_sprite(btn_resume.sprite, 0, btn_resume.x, btn_resume.y);
	draw_sprite(btn_restart.sprite, 0, btn_restart.x, btn_restart.y);
	//draw_sprite(btn_howtoplay.sprite, 0, btn_howtoplay.x, btn_howtoplay.y);
	draw_sprite(btn_quit.sprite, 0, btn_quit.x, btn_quit.y);
	
	draw_set_halign(fa_left);
	}
}