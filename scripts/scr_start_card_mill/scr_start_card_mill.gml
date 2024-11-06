
/// @function					start_card_mill([deck_id]);
/// @param {id} deck_id			start deck id
/// @description				put the top card of a start deck into discard

function start_card_mill (deck_id = id) {
	with (deck_id) {
		// add card name to discard
		if (deck_size > 0) {
			//discard.discard[discard.discard_size] = deck[deck_size-1][0];
			var _discard = player.discard;
			deck_size --;
			_discard.discard[_discard.discard_size] = deck[deck_size][0];
			deck[deck_size][0] = "";
			deck[deck_size][1] = false;
			_discard.discard_size ++;
		}
	}
	//return;
}