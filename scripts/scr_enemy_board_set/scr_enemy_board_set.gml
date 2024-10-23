function scr_enemy_board_set(){
	// set enemy placement positions
	var _cord_x = card_width *0.5+card_spacing*1;
	var _cord_y = card_height*3.5+card_spacing*5;
	var _i = 0;
	for (var _iy = 0; _iy < board_rows; _iy++) {
		for (var _ix = 0; _ix < board_cols; _ix++) {
			enemy_cords[_i] = [
				_cord_x+_ix*(card_width +card_spacing),
				_cord_y+_iy*(card_height+card_spacing)
			];
			enemy_card[_i] = noone;
			_i++;
		}
	}
	return;
}