function scr_start_card_mill () {
	// add card name to discard
	if (deck_size > 0) {
		discard.discard[discard.discard_size] = deck[deck_size-1][0];
		deck[deck_size-1][0] = "";
		deck[deck_size-1][1] = false;
		deck_size --;
		discard.discard_size ++;
	}
	return;
}