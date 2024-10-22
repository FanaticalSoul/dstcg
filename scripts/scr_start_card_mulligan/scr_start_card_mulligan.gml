function scr_start_card_mulligan() {
	//var _flag = true; // wether a valid mulligan can be taken
	show_debug_message("call m 1");
	for (var _i = 0; _i < hand_size; _i++) {
		show_debug_message(string(hand_card[_i].card_stats[0]));
		if (struct_get(hand_card[_i].card_stats[0],"type") == "equipment") {
			if (struct_get(hand_card[_i].card_stats[0],"attack") != "none") {
				// this is an invalid mulligan
				return;
			}
		}
	}
	show_debug_message("call m 2");
	// take mulligan
	while (hand_size > 0) {
		scr_start_card_return (hand_card[0].id);
	}
	with (obj_start_deck) {
		deck = scr_deck_shuffle (deck, deck_size, true);
		if (alarm[0] == -1) {
			alarm[0] = 1;
		}
	}
	return;
}