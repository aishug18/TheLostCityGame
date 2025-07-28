// Clean up, open portal
global.puzzle_active = false;
	
with(obj_PuzzleManager) {
	current_puzzle = noone;
}
	
// Spawn portal
instance_create_layer(128, 849, "Objects", obj_Portal);
	
// Destroy the puzzle after it's solved
instance_destroy();