
/// @function					start_card_mill([player_id]);
/// @param {id} player_id		player id
/// @description				try to mulligan this player's hand

function start_card_mulligan(player_id = id) {
	with (player_id) {
		if (mulligan_candidate(hand)) {
			// take mulligan
			while (hand_size > 0) {
				//sout(hand_size);
				//sout(hand[hand_size-1].card_stats[0].name);
				start_card_return(deck,hand[hand_size-1]);
			}
			with (deck) {
				deck = scr_deck_shuffle (deck, deck_size, true);
				if (alarm[0] == -1) alarm[0] = 1;
			}
		}
	}
}

function mulligan_candidate (hand) {
	// check if this is an invalid mulligan
	for (var i = 0; i < array_length(hand); i++) {
		if (hand[i].card_stats[0].type == "equipment") {
			if (hand[i].card_stats[0].attack != "none") return false;
		}
	}
	return true;
}