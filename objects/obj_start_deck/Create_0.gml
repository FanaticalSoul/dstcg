/// @description Insert description here

player = obj_player;

// display information

// reveal state
deck_reveal = false;
deck_reveal_offset = 0;
deck_reveal_full = false; // reveal all cards in deck
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / obj_player.deck_max;
//deck_spacing = 1;
// deck cord varibles
deck_reveal_y = player.y-sprite_height-deck_reveal_spacing*3/4;