function scr_start_card_draw (_num){
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


			// create card object using deck offset		
			var _tmp_x = obj_start_deck.x+deck_size*obj_start_deck.deck_spacing;
			var _tmp_y = obj_start_deck.y-deck_size*obj_start_deck.deck_spacing;

			
			hand_card[hand_size-1] = instance_create_depth(_tmp_x,_tmp_y,-hand_size-1, obj_start_card, {
				card_to_hand : true,
				card_number : hand[hand_size-1][0],
				hand_position : hand_size-1,
				card_in_hand : false
			});
			
		}
	}
	return;
}