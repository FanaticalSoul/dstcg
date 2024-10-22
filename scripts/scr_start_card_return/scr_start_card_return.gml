// return a card from hand to deck
function scr_start_card_return (id) {
	// add name to deck
	obj_start_deck.deck[obj_start_deck.deck_size][0] = obj_player.hand[id.hand_position][0];
	obj_start_deck.deck[obj_start_deck.deck_size][1] = true;
	obj_start_deck.deck_size ++;
	instance_destroy(id);
	return;
}