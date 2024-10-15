function scr_shuffle_deck(_deck, _cards, _states = false, _shuffles = 100){
	//var _shuffles = 100; // ammount of shuffles
	//var _cards = array_length(_deck);
	if (_cards==0) {return [];}
	else {
		for (i = 0; i < _shuffles; i++) {
			// shuffle
			for (j = 0; j < _cards; j++) {
				// set varibles
				var _card = 0;
				var _tmp_pos_a = irandom_range(0,_cards);
				var _tmp_card_a = 0;
				// get card and temp card (a)
				if (_states) {
					_card = _deck[j][0];
					_tmp_card_a = _deck[_tmp_pos_a][0];
				}
				else {
					_card = _deck[j];
					_tmp_card_a = _deck[_tmp_pos_a];
				}
				// if cards exist
				if (_card > 0 && _tmp_card_a > 0) {
					var _tmp_card_b = _card;
					if (_states) {
						_deck[j][0] = _tmp_card_a;
						_deck[_tmp_pos_a][0] = _tmp_card_b;
					}
					else {
						_deck[j] = _tmp_card_a;
						_deck[_tmp_pos_a] = _tmp_card_b;
					}
				}
			}
		}
		return _deck;
	}
}