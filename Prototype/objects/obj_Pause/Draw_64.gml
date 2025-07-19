if (paused) {
    // Dark background
	draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width()/2, 300, "PAUSED");
    
	// Buttons
	draw_set_color(c_white);
	draw_rectangle(btn_resume.x, btn_resume.y, btn_resume.x + btn_resume.w, btn_resume.y + btn_resume.h, false);
	draw_rectangle(btn_restart.x, btn_restart.y, btn_restart.x + btn_restart.w, btn_restart.y + btn_restart.h, false);
	draw_rectangle(btn_quit.x, btn_quit.y, btn_quit.x + btn_quit.w, btn_quit.y + btn_quit.h, false);
	
	draw_set_color(c_black);
	draw_text(btn_resume.x + btn_resume.w/2, btn_resume.y + btn_resume.h/2, "Resume");
	draw_text(btn_restart.x + btn_restart.w/2, btn_restart.y + btn_restart.h/2, "Restart");
	draw_text(btn_quit.x + btn_quit.w/2, btn_quit.y + btn_quit.h/2, "Quit");
	
	draw_set_halign(fa_left);
}