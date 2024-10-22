function scr_start_card_mulligan() {
	for (var _i = 0; _i < hand_size; _i++) {
		if (struct_get(hand_card[_i].card_stats[0],"type") == "equipment") {
			if (struct_get(hand_card[_i].card_stats[0],"attack") != "none") {
				return; // this is an invalid mulligan
			}
		}
	}
	// take mulligan
	while (hand_size > 0) {
		with (start_deck) {
			scr_start_card_return (player.hand_card[player.hand_size-1].id);
		}
	}
	with (start_deck) {
		deck = scr_deck_shuffle (deck, deck_size, true);
		if (alarm[0] == -1) alarm[0] = 1;
	}
	return;
}