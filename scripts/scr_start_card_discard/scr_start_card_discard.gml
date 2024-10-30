function scr_start_card_discard (id) {
	// add card name to discard
	discard[discard_size] = player.hand[id.hand_position];
	discard_size ++;
	instance_destroy(id);
	return;
}
function scr_start_card_stamina_discard (_id) {
	with (player.deck.discard) scr_start_card_discard(_id);
	return;
}
/*
function scr_start_card_stamina_discard (_id) {
	// add card name to discard
	with (player.deck.discard) {
		discard[discard_size] = player.hand[_id.hand_position];
		discard_size ++;
	}
	instance_destroy(_id);
	return;
}
*/