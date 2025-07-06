function spawn_puzzle_piece(start_x, start_y, sprite, _offset_x, _offset_y, _is_anchor){
    var inst = instance_create_layer(start_x, start_y, "Instances", obj_Puzzle2Piece);
	
    inst.sprite_index = sprite;
    inst.offset_x = _offset_x;
    inst.offset_y = _offset_y;
	inst.is_anchor = _is_anchor;

    return inst;
}