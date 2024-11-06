
/// @function					start_card_mill([player_id]);
/// @param {id} player_id		player id
/// @description				try to mulligan this player's hand

function start_card_mulligan(player_id = id) {
	with (player_id) {
		var _flag = true; // valid mulligan
		for (var i = 0; i < hand_size; i++) {
			if (hand[i].card_stats[0].type == "equipment") {
				// check if this is an invalid mulligan
				if (hand[i].card_stats[0].attack != "none") {
					_flag = false;
					break;
				}
			}
		}
		if (_flag) {
			// take mulligan
			while (hand_size > 0) {
				start_card_return(deck,hand[hand_size-1].id);
			}
			with (deck) {
				deck = scr_deck_shuffle (deck, deck_size, true);
				if (alarm[0] == -1) alarm[0] = 1;
			}
		}
	}
	//return;
}