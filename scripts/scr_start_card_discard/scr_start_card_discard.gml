function scr_start_card_discard (id) {
	// reset offset
	//obj_player.hand_offset = 0;
	// BUG001 // resolved //

	/*
	var _card_stats = noone;
	for (i = 0; i < array_length(start_card_stats); i++) {
		if (struct_get(start_card_stats[i][0],"name") == deck[deck_size][0]) {
			_card_stats = start_card_stats[i];
			break;
		}
	}
	*/
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
		/////////////////////// still need to work on this /// LOTS OF POSSIBLE ERRORS HERE IF I'M NOT CAREFUL
		array_delete(obj_player.hand,_hand_pos,1);
		show_debug_message(string(obj_player.hand));
		array_delete(obj_player.hand_card,_hand_pos,1);
		//obj_player.hand[_hand_pos][0] = ""; // name
		//obj_player.hand[_hand_pos][1] = true ; // revealed
		//obj_player.hand[_hand_pos][2] = false; // selected
		obj_player.hand_size --;
		// set card object offset
		//var _tmp_x = x+deck_size*deck_spacing;
		//var _tmp_y = y-deck_size*deck_spacing;
	}
	return;
}