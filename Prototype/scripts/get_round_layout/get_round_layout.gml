function get_round_layout(index){
	switch (index) {
		case 0:	// first image
            return [
                { x: 940, y: 470, sprite: spr_Piece0_0, offset_x: 0, offset_y: 0, is_anchor: true },	// anchor piece
                { x: 700, y: 750, sprite: spr_Piece0_1, offset_x: 35, offset_y: 122, is_anchor: false },
                { x: 1120, y: 640, sprite: spr_Piece0_2, offset_x: 82, offset_y: 39, is_anchor: false }
				// any more pieces needed
            ];
        case 1:	// second image
            return [
                { x: 960, y: 560, sprite: spr_Piece1_0, offset_x: 0, offset_y: 0, is_anchor: true },
                { x: 1130, y: 730, sprite: spr_Piece1_1, offset_x: -6, offset_y: -96, is_anchor: false }
            ];
        case 2:	// third image
            return [
                { x: 932, y: 535, sprite: spr_Piece2_0, offset_x: 0, offset_y: 0, is_anchor: true },
                { x: 721, y: 311, sprite: spr_Piece2_1, offset_x: 78, offset_y: 0, is_anchor: false }
            ];
	}
	return [];
}

// offset formula:
// offset_x = piece_x - anchor_x
// offset_y = piece_y - anchor_y