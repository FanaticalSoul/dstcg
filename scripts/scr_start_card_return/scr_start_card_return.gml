
/// @function					start_card_return(deck_id, [card_id]);
/// @param {id} deck_id			start deck id
/// @param {id} card_id			id of start card in hand
/// @description				return a card from hand to deck

function start_card_return (deck_id, card_id = id) {
	
	with (deck_id) {
		// add name to deck
		//deck[deck_size][0] = player.hand[id.hand_position];
		//deck[deck_size][0] = player.hand[card_id.hand_position].card_stats[0].name;
		deck[deck_size][0] = card_id.card_stats[0].name;
		deck[deck_size][1] = true;
		deck_size ++;
		// CiD
		instance_destroy(card_id);
		/*
		if (card_id.alarm[2] == -1) {
			sout("start card returned");
			card_id.alarm[2] = 1;
		}
		*/
	}
	//return;
}