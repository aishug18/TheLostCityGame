function get_round_layout_v2(index){
	switch (index) {
		case 0:	// first image
            return [
                { x: 624, y: 362, sprite: NEW_Pu2_C_P1, offset_x: 0, offset_y: 0, is_anchor: true },	// anchor piece
                { x: 1648, y: 800, sprite: NEW_Pu2_C_P2, offset_x: 0, offset_y: 326, is_anchor: false },
                { x: 992, y: 816, sprite: NEW_Pu2_C_P3, offset_x: 301, offset_y: -3, is_anchor: false },
				{ x: 1584, y: 256, sprite: NEW_Pu2_C_P4, offset_x: 301, offset_y: 313, is_anchor: false },
				{ x: 224, y: 672, sprite: NEW_Pu2_C_P5, offset_x: 704, offset_y: 69, is_anchor: false },
				{ x: 1088, y: 256, sprite: NEW_Pu2_C_P6, offset_x: 631, offset_y: 400, is_anchor: false },
            ];
        case 1:	// second image
            return [
                { x: 1067, y: 731, sprite: NEW_Pu2_P_P1, offset_x: 0, offset_y: 0, is_anchor: true },
                { x: 1664, y: 720, sprite: NEW_Pu2_P_P2, offset_x: -303, offset_y: -61, is_anchor: false },
				{ x: 432, y: 704, sprite: NEW_Pu2_P_P3, offset_x: 68, offset_y: -294, is_anchor: false },
				{ x: 1296, y: 272, sprite: NEW_Pu2_P_P4, offset_x: -235, offset_y: -363, is_anchor: false }
            ];
        case 2:	// third image
            return [
                { x: 1178, y: 669, sprite: NEW_Pu2_S_P1, offset_x: 0, offset_y: 0, is_anchor: true },
                { x: 336, y: 256, sprite: NEW_Pu2_S_P2, offset_x: -70, offset_y: -308, is_anchor: false },
				{ x: 1584, y: 224, sprite: NEW_Pu2_S_P3, offset_x: -342, offset_y: 66, is_anchor: false },
				{ x: 544, y: 800, sprite: NEW_Pu2_S_P4, offset_x: -410, offset_y: -237, is_anchor: false }
            ];
	}
	return [];
}

// offset formula:
// offset_x = piece_x - anchor_x
// offset_y = piece_y - anchor_y