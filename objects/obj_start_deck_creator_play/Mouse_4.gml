/// @description delete old save and enter room

with (obj_start_deck_creator) {
	if (deck_size == deck_min && obj_sdc_selection_character.selected != "") {
		// delete previous save
		save_game_delete(file_deck);
		save_game_delete(file_encounter);
		save_game_delete(file_map);
		// set deck
		save_data_deck_start(deck, obj_sdc_selection_character.selected);
		// update room
		global.room_index = 2;
		room_goto(global.room_index);
	}
}