function scr_character_board_set (){
	// pick positions on board
	var _i = 0;
	for (var _iy = 0; _iy < BOARDROWS; _iy++) {
		for (var _ix = 0; _ix < BOARDCOLS; _ix++) {
			board_cords[_i][0] = (CARDSPACING+card_width/2)+_ix*(CARDSPACING+card_width); // 24
			board_cords[_i][1] = start_deck.y+_iy*(CARDSPACING+card_height); // 208
			board_card [_i] = noone;
			_i++;
		}
	}
	return;
}