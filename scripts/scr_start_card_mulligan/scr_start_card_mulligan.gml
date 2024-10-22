function scr_start_card_mulligan() {
	for (var _i = 0; _i < hand_size; _i++) {
		if (struct_get(hand_card[_i].card_stats[0],"type") == "equipment") {
			if (struct_get(hand_card[_i].card_stats[0],"attack") != "none") {
				// this is an invalid mulligan
				return;
			}
		}
	}
	// take mulligan
	while (hand_size > 0) scr_start_card_return (hand_card[hand_size-1].id);
	with (obj_start_deck) {
		deck = scr_deck_shuffle (deck, deck_size, true);
		if (alarm[0] == -1) alarm[0] = 1;
	}
	return;
}