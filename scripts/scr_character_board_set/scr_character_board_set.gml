function scr_character_board_set (){
	// pick positions on board
	var _i = 0;
	for (var _iy = 0; _iy < board_rows; _iy++) {
		for (var _ix = 0; _ix < board_cols; _ix++) {
			board_cords[_i][0] = (card_spacing+card_width/2)+_ix*(card_spacing+card_width); // 24
			board_cords[_i][1] = start_deck.y+_iy*(card_spacing+card_height); // 208
			board_card [_i] = noone;
			_i++;
		}
	}
	return;
}