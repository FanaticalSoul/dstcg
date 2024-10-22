// return a card from hand to deck
function scr_start_card_return (id) {
	//show_debug_message("call 1");
	var _hand_pos = -1;
	for (var _i = 0; _i < obj_player.hand_size; _i++) {
		if (obj_player.hand_card[_i] == id) {
			_hand_pos = _i;
			break;
		}
	}
	//show_debug_message("call 2");
	if (_hand_pos != -1) {
		// add name to deck
		obj_start_deck.deck[obj_start_deck.deck_size][0] = obj_player.hand[_hand_pos][0];
		obj_start_deck.deck[obj_start_deck.deck_size][1] = true;
		obj_start_deck.deck_size ++;
		// remove card from hand
		array_delete(obj_player.hand,_hand_pos,1);
		array_delete(obj_player.hand_card,_hand_pos,1);
		obj_player.hand_size --;
		for (var _i = _hand_pos; _i < obj_player.hand_size; _i++) {
			obj_player.hand_card[_i].hand_position = obj_player.hand_card[_i].hand_position-1;
		}
	}
	return;
}