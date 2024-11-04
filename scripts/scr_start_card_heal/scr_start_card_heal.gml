function scr_start_card_heal (_value) {
	var i = 0;
	while (discard.discard_size > 0 && i < _value) {
		array_insert(deck, 0, [discard.discard[0],true]);
		deck_size ++;
		array_delete(deck,array_length(deck)-1,1);
		array_delete(discard.discard,0,1);
		array_push(discard.discard,"");
		discard.discard_size --;
		i ++;
	}
	return;
}