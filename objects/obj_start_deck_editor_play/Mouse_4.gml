/// @description update deck and leave editor


with (obj_start_deck_editor) {
	if (deck_size == get_deck_size()) {
		// update deck
		save_data_deck_adjustment(deck);
		 // toggle off bonfire and reset cleared objectives
		var _save_data = get_data_file(file_map);
		_save_data[1].bonfire = false;
		for (var i = 0; i < array_length(_save_data[0]); i++) {
			//_save_data[0][i].active = false;
			_save_data[0][i].cleared = false;
		}
		set_data_file(_save_data, file_map);
		// go back to map
		global.room_index = 2;
		room_goto(global.room_index);
		//game_restart(); // TF
	}
}