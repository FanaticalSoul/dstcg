/// @description set varibles

// set varibles from deck
discard_reveal_x = start_discard_reveal_cords[0];
discard_reveal_y = start_discard_reveal_cords[1];
// initalize varibles
discard_reveal_offset = 0;
discard_reveal = false;
cycle_size = 0; // used to keep track of cards being cycled
// set varibles
tmp_depth = depth; // fixes bug with displaying over enemy cards
// set all discard cards to be empty
var i = 0;
for (i = 0; i < max_deck; i++) discard[i] = "";
// trim discard being loaded
var _trim_size = 0;
for (i = 0; i < array_length(discard_load); i++) {
	if (discard_load[i] != "") _trim_size++;
}
// load discard
for (i = 0; i < array_length(_trim_size); i++) discard[i] = discard_load[i];
discard_size = i;
// log creation
sout("created discard");