function scr_start_card_discard (id) {
	var _hand_pos = -1;
	for (i = 0; i < obj_player.hand_size; i++) {
		//obj_player.hand[i][0] = "";
		if (obj_player.hand_card[i] == id) {
			_hand_pos = i;
			break;
		}
	}
	if (_hand_pos != -1) {
		// add name to discard
		obj_start_discard.discard[obj_start_discard.discard_size] = obj_player.hand[_hand_pos][0];
		obj_start_discard.discard_size ++;
		// remove card from hand
		array_delete(obj_player.hand,_hand_pos,1);
		array_delete(obj_player.hand_card,_hand_pos,1);
		obj_player.hand_size --;
		for (i = _hand_pos; i < obj_player.hand_size; i++) {
			obj_player.hand_card[i].hand_position = obj_player.hand_card[i].hand_position-1;
		}
		// set card object offset
		//var _tmp_x = x+deck_size*deck_spacing;
		//var _tmp_y = y-deck_size*deck_spacing;
	}
	return;
}