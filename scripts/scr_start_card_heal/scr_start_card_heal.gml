function scr_start_card_heal (_value) {
	var _i = 0;
	while (discard.discard_size > 0 && _i < _value) {
		array_insert(deck, 0, [discard.discard[0],true]);
		deck_size --;
		discard.discard[0] = ""; // TF
		discard.discard_size --;
		_i ++;
	}
	return;
}