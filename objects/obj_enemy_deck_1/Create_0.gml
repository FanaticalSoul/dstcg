/// @description Insert description here

deck_point =  0; // position in deck (pointer)
deck_max   = 10; // starting deck size ( max size )
deck_size  =  0;
enemy_count =  0; // enemy cards currently in play
cards_max  =  6; // max enemy cards allowed in play

// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i][0] = 0; // sprite_index
	deck[i][1] = false; // evealed
}

// set cards in deck ( no states )
i = 0;
deck[i++] = 1;
deck[i++] = 2;
deck[i++] = 3;
deck[i++] = 4;
deck[i++] = 5;
deck[i++] = 6;
deck[i++] = 7;
deck[i++] = 8;
deck[i++] = 9;
deck[i++] = 0;
deck_size = i;
i = 0;
//
for (i = 0; i < cards_max; i++) {
	enemy[i] = 0;
	enemy_card[i] = noone;
}
i = 0;