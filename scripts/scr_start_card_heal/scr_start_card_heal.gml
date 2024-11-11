function scr_start_card_heal (value, player_id = id) {
	with (player_id) {
		var i = 0;
		while (discard.discard_size > 0 && i < value) {
			array_insert(deck.deck, 0, [discard.discard[0],true]);
			deck.deck_size ++;
			array_delete(deck.deck,array_length(deck.deck)-1,1);
			array_delete(discard.discard,0,1);
			array_push(discard.discard,"");
			discard.discard_size --;
			i++;
		}
	}
}