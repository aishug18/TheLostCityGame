if (in_range()) {
	talk = true;
	//first = !first;
}
else {
	talk = false;
}

if (talk) {
	sprite_index = NPC_Talk;
}
else {
	sprite_index = NPC_Idle;
}