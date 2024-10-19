/// @description Insert description here
// set enemy card stats
enemy_card_stats = scr_enemy_card_stats_set();
deck_size = 0;
enemy_count = 0; // enemy cards currently in play
enemy_max = 6; // max enemy cards allowed in play
field_spaces = 6; // spaces around for enemies
deck_spacing = deck_spacing_width_in_pixels / deck_max;
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i] = "";
}
// set cards in deck ( no states )
i = 0;
deck[i++] = "hollow soldier";
deck[i++] = "irithyllian beast hound";
deck[i++] = "peasant hollow";
deck[i++] = "hollow soldier";
deck[i++] = "irithyllian beast hound";
deck[i++] = "peasant hollow";
deck[i++] = "hollow soldier";
deck[i++] = "irithyllian beast hound";
deck[i++] = "peasant hollow";
enemy_max = 6; // TF
deck_size = i;
i = 0;
// automatically shuffle after deck is made
for (i = 0; i < field_spaces; i++) {
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