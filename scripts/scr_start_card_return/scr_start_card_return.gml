// return a card from hand to deck
function scr_start_card_return (id) {
	// add name to deck
	deck[deck_size][0] = player.hand[id.hand_position];
	deck[deck_size][1] = true;
	deck_size ++;
	instance_destroy(id);
	return;
}