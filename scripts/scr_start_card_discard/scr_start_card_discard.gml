
/// @function					start_card_discard(discard_id, [card_id]);
/// @param {id} discard_id		discard id
/// @param {id} card_id			start card id
/// @description				discard a start card from hand

function start_card_discard (discard_id, card_id = id) {
	with (discard_id) {
		// add card name to discard
		discard[discard_size] = player.hand[card_id.hand_position].card_stats[0].name;
		discard_size ++;
		player.hand_offset = 0;
		instance_destroy(card_id);
	}
}