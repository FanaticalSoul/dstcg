/// @description delete old save and enter room

with (obj_start_deck_creator) {
	if (deck_size == deck_min) {
		save_start_deck(deck);
		//global.new_game = true;
		save_game_delete();
		room_goto(2);
	}
}