/// @description update deck and leave editor

with (obj_start_deck_editor) {
	if (deck_size == get_deck_size()) {
		// pay cost
		var _souls = int64(get_data_file(file_deck)[1].inventory[1]);
		var _dept = -(_souls-get_market_dept());
		if (_dept <= 0) {
			// pay costs
			var _save_data = get_data_file(file_deck);
			_save_data[1].inventory[1] = abs(_dept);
			set_data_file(file_deck, _save_data);
			// change ownership of cards
			for (var i = 0; i < deck_size; i++) {
				if (is_market_card(deck[i])) {
					deck[i] = get_market_card_name(deck[i]);
				}
			}
			// update deck
			save_data_deck_adjustment(deck);
			 // toggle off bonfire and reset cleared objectives
			_save_data = get_data_file(file_map);
			_save_data[1].bonfire = false;
			for (var i = 0; i < array_length(_save_data[0]); i++) {
				_save_data[0][i].cleared = false;
			}
			set_data_file(_save_data, file_map);
			// go back to map
			global.room_index = 2;
			room_goto(global.room_index);
		}
	}
}