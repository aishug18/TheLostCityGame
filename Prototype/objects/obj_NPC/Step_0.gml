var player_in_range = in_range();

// Switch between talking and idle sprites
if (player_in_range) {
	talk = true;
	sprite_index = NPC_Talk;
	audio_play_sound(cartoon_voice, 1, false, 1, 1.75, 1);
}
else {
	talk = false;
	sprite_index = NPC_Idle;
}

// Alternate between dialogues
if (player_in_range && !was_in_range) {	// detects edge transitions, when the player enters range
	dialogue_sprite = dialogues[index];
	index = (index + 1) mod array_length(dialogues);	// Advance index, wrap around if necessary
}

was_in_range = player_in_range;