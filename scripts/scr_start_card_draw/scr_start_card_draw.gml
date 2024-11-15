

function start_card_draw (deck_id = id) {
	with (deck_id) {
		// milled out // WoL
		if (deck_size - 1 < 0) {
			// end the encounter as a loss // WoL
			//show_debug_message("play you died animation ( WoL )");
			sout("you died");
		}
		// if max hand size was reached or surpassed
		//else if (player.hand_size >= hand_max) {
		//	sout("max hand size was reached or surpassed ( WoL )");
		//}
		else {
			// reset offset
			player.hand_offset = 0;
			player.hand_size ++;
			// get card reveal status
			var _card_name = deck[deck_size-1][0];
			var _show_card = deck[deck_size-1][1];
			// remove card from deck
			deck[deck_size-1][0] = "";
			deck[deck_size-1][1] = false;
			deck_size --;
			// set card object offset
			var _tmp_x = x+deck_size*deck_spacing;
			var _tmp_y = y-deck_size*deck_spacing;
			// create card object
			player.hand[player.hand_size-1] = instance_create_depth(_tmp_x,_tmp_y,-player.hand_size-1, obj_start_card, {
				//card_stats : _card_stats,
				card_name : _card_name,
				hand_position : player.hand_size-1,
				player : player,
				show_card : _show_card
			});
			// log action
			if (deck_size-1<0) sout(player.character.character+" draws nothing");
			else sout([player.character.character, "draws", deck[deck_size-1][0]], " ");
		}
	}
}