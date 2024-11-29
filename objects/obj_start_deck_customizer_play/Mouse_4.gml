/// @description delete old save and enter room


with (obj_start_deck_customizer) {
	if (deck_size == get_deck_size()) {
		// delete previous save
		///////save_game_delete(file_deck);
		save_data_deck_adjustment(deck);
		global.room_index = 2;
		room_goto(global.room_index);
	}
}