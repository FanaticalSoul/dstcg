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
