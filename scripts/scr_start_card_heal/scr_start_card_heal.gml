function scr_start_card_heal (_value) {
	var i = 0;
	while (player.discard.discard_size > 0 && i < _value) {
		array_insert(deck, 0, [player.discard.discard[0],true]);
		deck_size ++;
		array_delete(deck,array_length(deck)-1,1);
		array_delete(player.discard.discard,0,1);
		array_push(player.discard.discard,"");
		player.discard.discard_size --;
		i ++;
	}
}