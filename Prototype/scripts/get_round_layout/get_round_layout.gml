function get_round_layout(index){
	switch (index) {
		case 0:	// first image
            return [
                { x: 992, y: 640, sprite: Pu2_C_P2, offset_x: 0, offset_y: 0, is_anchor: true, is_main_anchor: true },	// anchor piece
                { x: 1280, y: 600, sprite: Pu2_C_P1, offset_x: 0, offset_y: 0, is_anchor: true, is_main_anchor: false },
                { x: 640, y: 928, sprite: Pu2_C_P3, offset_x: 288, offset_y: -271, is_anchor: false, is_main_anchor: false },
				{ x: 704, y: 667, sprite: Pu2_C_P4, offset_x: 0, offset_y: 0, is_anchor: true, is_main_anchor: false },
				{ x: 1120, y: 896, sprite: Pu2_C_P5, offset_x: -286, offset_y: -173, is_anchor: false, is_main_anchor: false },
				{ x: 1152, y: 288, sprite: Pu2_C_P6, offset_x: -307, offset_y: -326, is_anchor: false, is_main_anchor: false },
				{ x: 704, y: 320, sprite: Pu2_C_P7, offset_x: 0, offset_y: -233, is_anchor: false, is_main_anchor: false }
				// any more pieces needed
            ];
        case 1:	// second image
            return [
                { x: 976, y: 592, sprite: Pu2_P_P5, offset_x: 0, offset_y: 0, is_anchor: true, is_main_anchor: true },
                { x: 1312, y: 608, sprite: Pu2_P_P1, offset_x: -86, offset_y: -160, is_anchor: false, is_main_anchor: false },
				{ x: 1248, y: 256, sprite: Pu2_P_P2, offset_x: -226, offset_y: -69, is_anchor: false, is_main_anchor: false },
				{ x: 656, y: 848, sprite: Pu2_P_P3, offset_x: -3, offset_y: -233, is_anchor: false, is_main_anchor: false },
				{ x: 1136, y: 880, sprite: Pu2_P_P4, offset_x: 137, offset_y: -93, is_anchor: false, is_main_anchor: false },
				{ x: 768, y: 272, sprite: Pu2_P_P6, offset_x: -225, offset_y: 41, is_anchor: false, is_main_anchor: false },
				{ x: 656, y: 528, sprite: Pu2_P_P7, offset_x: 224, offset_y: 32, is_anchor: false, is_main_anchor: false }
            ];
        case 2:	// third image
            return [
                { x: 896, y: 544, sprite: Pu2_S_P4, offset_x: 0, offset_y: 0, is_anchor: true, is_main_anchor: true },
                { x: 1248, y: 336, sprite: Pu2_S_P1, offset_x: 78, offset_y: 209, is_anchor: false, is_main_anchor: false },
				{ x: 928, y: 224, sprite: Pu2_S_P2, offset_x: 8, offset_y: 147, is_anchor: false, is_main_anchor: false },
				{ x: 608, y: 448, sprite: Pu2_S_P3, offset_x: 139, offset_y: 53, is_anchor: false, is_main_anchor: false },
				{ x: 1104, y: 880, sprite: Pu2_S_P5, offset_x: 113, offset_y: -124, is_anchor: false, is_main_anchor: false },
				{ x: 720, y: 832, sprite: Pu2_S_P6, offset_x: 97, offset_y: -213, is_anchor: false, is_main_anchor: false },
				{ x: 1232, y: 592, sprite: Pu2_S_P7, offset_x: -29, offset_y: -167, is_anchor: false, is_main_anchor: false }
            ];
	}
	return [];
}

// offset formula:
// offset_x = piece_x - anchor_x
// offset_y = piece_y - anchor_y