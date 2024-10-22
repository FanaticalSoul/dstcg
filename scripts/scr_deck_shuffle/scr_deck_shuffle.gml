function scr_deck_shuffle (_deck, _cards, _states = false, _shuffles = 100){
	if (_cards==0) {return [];}
	else {
		for (i = 0; i < _shuffles; i++) {
			// shuffle
			for (j = 0; j < _cards; j++) {
				// set card revealed state to false // TF
				if (_states) {
					if (_deck[j][1]) _deck[j][1] = false;
				}
				// set varibles
				var _tmp_pos_a = irandom_range(0,_cards-1);
				// get card and temp card (a)
				var _card = _deck[j];
				var _tmp_card_a = _deck[_tmp_pos_a];
				// check if card exists (based on state)
				var _flag = false;
				if (_states) {
					if (_card[0] != "" && _tmp_card_a[0] != "") _flag = true;
				}
				else if (_card != "" && _tmp_card_a != "") _flag = true;
				// if card exists
				if (_flag) {
					var _tmp_card_b = _card;
					_deck[j] = _tmp_card_a;
					_deck[_tmp_pos_a] = _tmp_card_b;
				}
			}
		}
		return _deck;
	}
}