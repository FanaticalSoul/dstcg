/// @description update deck and leave editor

with (obj_start_deck_editor) {
	if (deck_size == get_sde_deck_size()) {
		// pay cost
		var _souls = int64(get_data_file(file_deck)[1].inventory[1]);
		var _remaining_souls = _souls-get_market_dept();
		if (_remaining_souls >= 0) {
			// pay costs
			var _save_data = get_data_file(file_deck);
			_save_data[1].inventory[1] = _remaining_souls;
			// change ownership of cards // add them to inventory
			for (var i = 0; i < array_length(deck); i++) {
				if (deck[i] != "") {
					if (is_market_card(deck[i])) {
						deck[i] = get_market_card_name(deck[i]);
						// add card to inventory
						array_push(_save_data[1].inventory[0], deck[i]);
					}
				}
			}
			set_data_file(_save_data, file_deck);
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