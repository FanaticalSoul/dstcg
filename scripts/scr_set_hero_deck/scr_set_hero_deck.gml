function scr_set_hero_deck(){
	deck_point = 0; // position in deck (pointer)
	deck_min = 28; // starting deck size
	deck_max = 40; // ending deck size
	// prevent errors for decks smaller than the max size of deck
	for (i = 0; i < deck_max; i++) {
		deck[i][0] = 0; // sprite_index
		deck[i][1] = false; // evealed
	}
	return;
}

function scr_set_hero_deck_cards () {
	// set cards in deck
	i = 0;
	/*
	// 11 faith cards
	for (j = 0; j < 11; j++) {deck[i++][0] = 12;}
	// 4 int cards
	for (j = 0; j <  4; j++) {deck[i++][0] = 11;}
	// 4 str cards
	for (j = 0; j <  4; j++) {deck[i++][0] = 13;}
	*/
	deck[i++][0] = 1;
	deck[i++][0] = 2;
	deck[i++][0] = 3;
	deck[i++][0] = 4;
	deck[i++][0] = 5;
	deck[i++][0] = 6;
	deck[i++][0] = 7;
	deck[i++][0] = 8;
	deck[i++][0] = 9;
	deck[i-2][1] = true; // reveal card under top card
	deck_size = i;
	i = 0; // reset increments
	return;
}