/// @description Insert description here





// deck information
deck_size = 0; // cards in deck
deck_point = 0; // position in deck (pointer)
deck_min = 28; // starting deck size
deck_max = 40; // ending deck size
deck_reveal = false;
// custom adjustments
deck_spacing = 4 / deck_max;



// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i] = [0,false]; // sprite_index, revealed
}
// set cards in deck
i = 0;
deck[i++][0] = 1;
deck[i++][0] = 2;
deck[i++][0] = 3;
deck[i++][0] = 1;
deck[i++][0] = 2;
deck_size = i;



// set sprites
i = 0;
sprites[i++] = spr_card_back;
sprites[i++] = spr_card_1;
sprites[i++] = spr_card_2;
sprites[i++] = spr_card_3;
sprites[i++] = spr_card_4;
sprites[i++] = spr_card_5;
sprites[i++] = spr_card_6;
sprites[i++] = spr_card_7;
sprites[i++] = spr_card_8;
sprites[i++] = spr_card_9;
// set macro ( read-only global varible ) to avoid reading nonexistant cards
#macro HEROCARDCOUNT i
// 
i = 0; // reset increments