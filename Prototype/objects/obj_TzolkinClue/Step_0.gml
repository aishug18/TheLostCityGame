if (place_meeting(x, y, obj_Player) && !collected) {
	with (obj_JournalManager) {
		add_clue(other._id, other.sprite, other._x, other._y);
	}
	array_push(global.level_2_clues, _id);
	
	audio_play_sound(Clue_or_Prop, 1, false);
	
	collected = true;
	sprite_index = CollectClue_spr;
	alarm[0] = 80;
}