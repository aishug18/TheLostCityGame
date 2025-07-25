// draw_set_font(*font name*);	// if you have a font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (how_to_play) {
	// Background
	draw_sprite(MenuBg_spr, 0, 0, 0);
	
	draw_sprite(HowToPlayTitle_spr, 0, 960, 162);
	draw_sprite(Instr2_spr, 0, 960, 435);
	draw_sprite(Instr3_spr, 0, 960, 697);
	draw_sprite(Instr1_spr, 0, 960, 947);
		
	draw_sprite(btn_back.sprite, 0, btn_back.x, btn_back.y);
}
else {
	// Background
	draw_sprite(GameTitle_spr, 0, 0, 0);
	
	// Buttons
	draw_set_color(c_white);
	draw_rectangle(button_start.x, button_start.y, button_start.x + button_start.w, button_start.y + button_start.h, false);
	draw_rectangle(btn_howtoplay.x, btn_howtoplay.y, btn_howtoplay.x + btn_howtoplay.w, btn_howtoplay.y + btn_howtoplay.h, false);
	draw_set_color(c_black);
	draw_text(button_start.x + button_start.w/2, button_start.y + button_start.h/2, "Start");
	draw_text(btn_howtoplay.x + btn_howtoplay.w/2, btn_howtoplay.y + btn_howtoplay.h/2, "How To Play");
	
	//draw_sprite(button_start.sprite, 0, button_start.x, button_start.y);
	//draw_sprite(btn_howtoplay.sprite, 0, btn_howtoplay.x, btn_howtoplay.y);
	draw_sprite(button_quit.sprite, 0, button_quit.x, button_quit.y);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);