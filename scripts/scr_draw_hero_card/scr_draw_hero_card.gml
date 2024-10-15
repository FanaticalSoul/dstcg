function scr_draw_hero_card (_num){
	if (obj_hero_deck.deck_size - _num < 0) {
		// milled out
		// end the encounter as a loss // WoL
		return; // do nothing
	}
	else if (obj_hero_hand.hand_size == HANDMAX) {
		// if max hand size was reached
		// add functionality to handle additional cards later // WoL
		return; // do nothing
	}
	else if (obj_hero_hand.hand_size > HANDMAX) {
		// WoL
		return; // do nothing
	}
	else {
		for	(i = 0; i < _num; i++) {
			// BUG001 // WoL //
			obj_hero_hand.hand[obj_hero_hand.hand_size++] = obj_hero_deck.deck[--obj_hero_deck.deck_size];
			// remember states
			obj_hero_hand.hand[obj_hero_hand.hand_size][1] = true; // reveal card
		}
	}
	return;
}