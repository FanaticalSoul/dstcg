
/// @function					start_card_discard(discard_id, [card_id]);
/// @param {id} discard_id		discard id
/// @param {id} card_id			start card id
/// @description				discard a start card from hand

function start_card_discard (discard_id, card_id = id) {
	with (discard_id) {
		// add card name to discard
		discard[discard_size] = player.hand[card_id.hand_position];
		discard_size ++;
		instance_destroy(card_id);
	}
	//return;
}

/*
function scr_start_card_stamina_discard (_id) {
	with (player.deck.discard) scr_start_card_discard(_id);
	//return;
}
*/