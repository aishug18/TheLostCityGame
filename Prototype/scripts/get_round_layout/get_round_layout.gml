function get_round_layout(index){
	switch (index) {
		case 0:	// first image
            return [
                { x: 1080, y: 530, correct_x: 960, correct_y: 540, sprite: spr_Piece0_0 },
                { x: 700, y: 750, correct_x: 960, correct_y: 540, sprite: spr_Piece0_1 },
                { x: 1120, y: 640, correct_x: 960, correct_y: 540, sprite: spr_Piece0_2 }
				// any more pieces needed
            ];
        case 1:	// second image
            return [
                { x: 350, y: 320, correct_x: 600, correct_y: 420, sprite: spr_Piece1_0 },
                { x: 500, y: 150, correct_x: 640, correct_y: 420, sprite: spr_Piece2_1 }
            ];
        case 2:	// third image
            return [
                { x: 360, y: 340, correct_x: 600, correct_y: 430, sprite: spr_Piece2_0 },
                { x: 480, y: 180, correct_x: 660, correct_y: 430, sprite: spr_Piece2_1 }
            ];
	}
	return [];
}