/// @description delete old save and enter room

with (obj_start_deck_creator) {
	if (deck_size == deck_min && obj_sdc_selection_character.selected != "") {
		save_start_deck(deck, obj_sdc_selection_character.selected);
		//global.new_game = true;
		save_game_delete(file_data);
		save_game_delete(file_map);
		//room_goto(3);
		// update room
		global.room_index = 2;
		room_goto(global.room_index);
	}
}