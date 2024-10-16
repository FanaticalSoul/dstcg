function scr_draw_hero_card (_num){
	if (deck_size - _num < 0) {
		// milled out
		// end the encounter as a loss // WoL
		return; // do nothing
	}
	else if (hand_size == hand_start) {
		// if max hand size was reached
		// add functionality to handle additional cards later // WoL
		return; // do nothing
	}
	else if (hand_size > hand_start) {
		// WoL
		return; // do nothing
	}
	else {
		for	(i = 0; i < _num; i++) {
			// reset offset
			hand_offset = 0;
			// BUG001 // resolved //
			deck_size --;
			hand[hand_size][0] = deck[deck_size][0];
			hand[hand_size][1] = deck[deck_size][1];
			hand[hand_size][2] = false; // selected
			hand_size ++;
			// remember states
			deck[deck_size][0] = 0;
			hand[hand_size-1][1] = true; // reveal card


			// create card object
			// the position will be a bit off // this is because the offset isn't being used
			
			
			

			
			hand_card[hand_size-1] = instance_create_depth(obj_hero_deck.x,obj_hero_deck.y,-hand_size-1, obj_hero_card, {
				card_to_hand : true,
				card_number : hand[hand_size-1][0],
				hand_position : hand_size-1,
				card_in_hand : false
			});
			
		}
	}
	return;
}