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
scr_set_hero_sprites();
// set macro ( read-only global varible ) to avoid reading nonexistant cards
#macro HEROCARDCOUNT array_length(sprites)
// 
i = 0; // reset increments