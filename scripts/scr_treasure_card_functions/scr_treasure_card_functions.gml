

function get_treasures (treasure_count = 1) {
	var _t_deck = get_treasure_deck();
	// add treasures to rewards ( allow duplicates )
	var _treasures = [];
	for (var i = 0; i < treasure_count; i++) {
	//for (var i = 0; i < array_length(_t_deck); i++) {
		//if (shuffle) _t_deck = scr_deck_shuffle(_t_deck, array_length(_t_deck)); // shuffle deck
		var _flag = false;
		var j = i;
		var _t_card = scr_deck_shuffle(_t_deck, array_length(_t_deck))[0];
		while (!_flag && j < treasure_count) {
			// try to validate card
			var _card_count = 0;
			_card_count += get_card_copy_count(_t_card, get_data_rewards());
			_card_count += get_card_copy_count(_t_card, get_data_loot());
			_card_count += get_card_copy_count(_t_card, get_data_inventory());
			_card_count += get_card_copy_count(_t_card, _treasures);
			if (_card_count < 4) _flag = true;
			else {
				_t_card = scr_deck_shuffle(_t_deck, array_length(_t_deck))[0];
				j++;
			}
		}
		if (_flag) array_push(_treasures, _t_card); // add top card
		if (array_length(_treasures) == array_length(_t_deck)*4) break;
		//else sout("unable to add card");
	}
	return _treasures;
}



function get_card_copy_count (card_name, deck) {
	var _card_count = 0;
	for (var i = 0; i < array_length(deck); i++) {
		if (deck[i] == card_name) _card_count++;
	}
	return _card_count;
}



function get_treasure_deck () {
	var _treasure_stats = get_treasure_stats();
	var _t_deck = [];
	for (var i = 0; i < array_length(_treasure_stats); i++) {
		array_push(_t_deck, _treasure_stats[i][0].name);
	}
	return _t_deck;
}