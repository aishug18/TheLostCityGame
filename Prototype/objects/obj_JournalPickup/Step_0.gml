if (place_meeting(x, y, obj_Player) && !journal_acquired) {
	journal_acquired = true;
	
	// Show journal icon on GUI
	obj_JournalIconGUI.is_visible = true;
	
	audio_play_sound(Clue_or_Prop, 1, false);
	
	sprite_index = CollectClue_spr;
	alarm[0] = 80;
}