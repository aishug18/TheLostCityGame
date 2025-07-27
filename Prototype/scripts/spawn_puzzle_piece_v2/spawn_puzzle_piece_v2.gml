function spawn_puzzle_piece_v2(start_x, start_y, sprite, _offset_x, _offset_y, _is_anchor){
    var inst = instance_create_layer(start_x, start_y, "Puzzle", obj_Puzzle2PieceV2);
	
    inst.sprite_index = sprite;
    inst.offset_x = _offset_x;
    inst.offset_y = _offset_y;
	inst.is_anchor = _is_anchor;
    return inst;
}