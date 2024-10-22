function scr_character_board_set(){
	// pick positions on field
	var _board_rows = 2;
	var _board_size = 6;
	var _i = 0;
	for (var _iy = 0; _iy < _board_rows; _iy++) {
		for (var _ix = 0; _ix < _board_size/_board_rows; _ix++) {
			board_cords[_i][0] =  24+_ix*(8+32); // 24
			board_cords[_i][1] = 208+_iy*(8+48); // 208
			board_card [_i] = noone;
			_i++;
		}
	}
	return;
}