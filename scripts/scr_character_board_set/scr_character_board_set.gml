function scr_character_board_set (){
	// pick positions on board
	var _cord_x = card_width *0.5+card_spacing*1;
	var _cord_y = card_height*1.5+card_spacing*2;
	var _i = 0;
	for (var _iy = 0; _iy < board_rows; _iy++) {
		for (var _ix = 0; _ix < board_cols; _ix++) {
			board_cords[_i] = [
				_cord_x+_ix*(card_width +card_spacing),
				_cord_y+_iy*(card_height+card_spacing)
			]
			board_card [_i] = noone;
			_i++;
		}
	}
	return;
}