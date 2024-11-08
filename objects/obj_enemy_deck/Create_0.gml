/// @description set varibles

// prevent errors for decks smaller than the max size of deck
for (var i = 0; i < e_deck_max; i++) deck[i] = "";
var i = 0;
for (i = 0; i < array_length(deck_load); i++) deck[i] = deck_load[i];
deck_size = i;
// shuffle deck on creation
if (!shuffled) {
	deck = scr_deck_shuffle (deck, deck_size);
	shuffled = true;
}
// log creation
sout("made enemy deck");

function enemy_count (e_deck_id = id) {
	var _enemy_count = 0;
	for (var i = 0; i < board_size; i++) {
		if (instance_exists(global.board_e_card[i])) {
			if (global.board_e_card[i].deck == e_deck_id) _enemy_count++;
		}
	}
	return _enemy_count;
}