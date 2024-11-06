function scr_start_card_draw (){
	// milled out // WoL
	if (deck_size - 1 < 0) {
		// end the encounter as a loss // WoL
		show_debug_message("play you died animation");
		return; // do nothing // WoL
	}
	// if max hand size was reached or surpassed
	else if (player.hand_size >= hand_max) return; // do nothing
	else {
		// reset offset
		player.hand_offset = 0;
		// get card stats
		/*
		var _card_stats = noone;
		for (var _i = 0; _i < array_length(start_card_stats); _i++) {
			if (struct_get(start_card_stats[_i][0],"name") == deck[deck_size-1][0]) {
				_card_stats = start_card_stats[_i];
				break;
			}
		}
		*/
		//var _card_stats = card_get_stats(start_card_stats, deck[deck_size-1][0]);
		// add card to hand
		//player.hand[player.hand_size] = deck[deck_size-1][0];
		player.hand_size ++;
		// get card reveal status
		var _show_card = deck[deck_size-1][1];
		// remove card from deck
		deck[deck_size-1][0] = "";
		deck[deck_size-1][1] = false;
		deck_size --;
		// set card object offset
		var _tmp_x = x+deck_size*deck_spacing;
		var _tmp_y = y-deck_size*deck_spacing;
		// create card object
		//player.hand_card[player.hand_size-1] = instance_create_depth(_tmp_x,_tmp_y,-player.hand_size-1, obj_start_card, {
		player.hand[player.hand_size-1] = instance_create_depth(_tmp_x,_tmp_y,-player.hand_size-1, obj_start_card, {
			//card_stats : _card_stats,
			card_stats : card_get_stats(start_card_stats, deck[deck_size-1][0]),
			hand_position : player.hand_size-1,
			player : player,
			show_card : _show_card
		});
	}
	return;
}