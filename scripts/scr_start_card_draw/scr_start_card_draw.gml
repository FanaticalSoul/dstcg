function scr_start_card_draw (_num){
	if (deck_size - _num < 0) {
		// milled out
		// end the encounter as a loss // WoL
		show_debug_message("play you died animation");
		return; // do nothing
	}
	else if (obj_player.hand_size == obj_player.hand_max) {
		// if max hand size was reached
		// add functionality to handle additional cards later // WoL
		return; // do nothing
	}
	else if (obj_player.hand_size > obj_player.hand_max) {
		// WoL
		return; // do nothing
	}
	else {
		for	(i = 0; i < _num; i++) {
			// reset offset
			obj_player.hand_offset = 0;
			// BUG001 // resolved //
			deck_size --;
			var _card_stats = noone;
			for (i = 0; i < array_length(start_card_stats); i++) {
				if (struct_get(start_card_stats[i][0],"name") == deck[deck_size][0]) {
					_card_stats = start_card_stats[i];
					break;
				}
			}
			obj_player.hand[obj_player.hand_size][0] = deck[deck_size][0];
			obj_player.hand[obj_player.hand_size][1] = deck[deck_size][1];
			//obj_player.hand[obj_player.hand_size][2] = false; // selected
			obj_player.hand_size ++;
			// remember states
			deck[deck_size][0] = "";
			deck[deck_size][1] = false;
			var _card_visable = deck[deck_size][1];
			obj_player.hand[obj_player.hand_size-1][1] = true; // reveal card
			// set card object offset
			var _tmp_x = x+deck_size*deck_spacing;
			var _tmp_y = y-deck_size*deck_spacing;
			// create card object
			obj_player.hand_card[obj_player.hand_size-1] = instance_create_depth(_tmp_x,_tmp_y,-obj_player.hand_size-1, obj_start_card, {
				card_stats : _card_stats,
				hand_position : obj_player.hand_size-1,
				player : player
			});
		}
	}
	return;
}