/// @description set varibles
// set start card stats
start_card_stats = scr_start_card_stats_set();
//deck_min = 28; // starting deck size
// initalize varibles
deck_reveal_offset = 0;
deck_reveal = false; // reveal state
deck_reveal_full = false; // reveal all cards in deck // TF
tmp_depth = depth; // fixes bug with displaying over enemy cards
// prevent errors for decks smaller than the max size of deck
for (var _i = 0; _i < max_deck; _i++) {
	deck[_i][0] = ""; // card name
	deck[_i][1] = false; // revealed
}
// set cards in deck from save
ini_open("Game1.ini")
for (var _i = 0; _i < deck_min; _i ++) {
	deck[_i][0] = ini_read_string("deck",string(_i),"");
}
ini_close();
deck_size = deck_min;
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / max_deck;
// deck cord varibles
deck_reveal_y = player.y-card_height-card_spacing*3/4;
deck_reveal_x = player.x-card_width/2;
// create assossiated discard // TF
discard = instance_create_depth(x,y+card_height+card_spacing,depth,obj_start_discard, {
	player : player,
	deck : id
});
// shuffle deck on creation
deck = scr_deck_shuffle (deck, deck_size, true);
// create health bar // TF // WoL
instance_create_depth(0,52,depth, obj_start_health, {
	deck : id
});