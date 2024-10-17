/// @description Insert description here
deck_size = 0;
enemy_count = 0; // enemy cards currently in play
enemy_max = 6; // max enemy cards allowed in play
sprites = scr_enemy_sprites_set(); // get sprites
deck_spacing = deck_spacing_width_in_pixels / deck_max;
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i][0] = 0; // sprite_index
	deck[i][1] = false; // evealed
}
// set cards in deck ( no states )
i = 0;
deck[i++] = [1,1];
deck[i++] = [2,1];
deck[i++] = [3,1];
deck[i++] = [4,1];
deck[i++] = [5,1];
deck[i++] = [6,1];
/*
deck[i++] = [7,1];
deck[i++] = [8,1];
deck[i++] = [9,1];
deck[i++] = [0,1];
/*
deck[i++] = [1,1];
deck[i++] = [2,2];
deck[i++] = [3,3];
deck[i++] = [4,4];
deck[i++] = [5,5];
deck[i++] = [6,6];
deck[i++] = [7,1];
deck[i++] = [8,2];
deck[i++] = [9,3];
deck[i++] = [0,4];
*/
deck_size = i;
i = 0;

// automatically shuffle after deck is made
scr_deck_shuffle(deck,deck_size,true);



//
for (i = 0; i < enemy_max; i++) {
	enemy[i] = 0;
	enemy_card[i] = noone;
	card_placements[i] = noone; // holds enemy position ( for when 2 cards end up being placed on top of each other)
}
i = 0;
// set enemy placement positions
enemy_field_offset = [0,56];
card_spacing = obj_player.hand_spacing;
var _cord_x = sprite_width /2+card_spacing+enemy_field_offset[0];
var _cord_y = sprite_height/2+card_spacing+enemy_field_offset[1];
for (iy = 0; iy < 2; iy++) {
	for (ix = 0; ix < 3; ix++) {
		enemy_cords[i] = [
			_cord_x+ix*(sprite_width +card_spacing),
			_cord_y+iy*(sprite_height+card_spacing)
		];
		i++;
	}
}
i = 0;
// |  24, 88 |  64, 88 | 104, 88 |
// |  24,144 |  64,144 | 104,144 |