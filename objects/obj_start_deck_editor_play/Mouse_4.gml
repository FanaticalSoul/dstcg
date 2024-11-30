/// @description delete old save and enter room


with (obj_start_deck_editor) {
	if (deck_size == get_deck_size()) {
		// delete previous save
		///////save_game_delete(file_deck);
		save_data_deck_adjustment(deck);
		// toggle off bonfire
		var _save_data = get_data_file(file_map);
		_save_data[1].bonfire = false;
		set_data_file(_save_data, file_map);
		// go back to map
		global.room_index = 2;
		room_goto(global.room_index);
	}
}