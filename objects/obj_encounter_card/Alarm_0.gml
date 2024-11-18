/// @description trigger encounter


//sout("test alarm");
// save room state
save_game_map();
// get random cards from decks // WoL
var _e_decks = [[],[],[]];
for (var i = 0; i < array_length(enemy_card_stats); i++) {
	array_push(_e_decks[enemy_card_stats[i].enemy_level-1], enemy_card_stats[i].name);
}
// shuffle decks
_e_decks[0] = scr_deck_shuffle(_e_decks[0], array_length(_e_decks[0]));
_e_decks[1] = scr_deck_shuffle(_e_decks[1], array_length(_e_decks[1]));
_e_decks[2] = scr_deck_shuffle(_e_decks[2], array_length(_e_decks[2]));
// get level 1 encounter information
var _level = 1;
//sout("stats");
//sout(card_get_stats(encounter_card_stats, card_name));
var _encounter = card_get_stats(encounter_card_stats, card_name).encounter[_level-1][0];
var _treasures = card_get_stats(encounter_card_stats, card_name).encounter[_level-1][1];
// add cards to deck
global.tmp_e_cards = [];
for (var i = 0; i < 3; i++) {
	for (var j = 0; j < _encounter[i]; j++) {
		array_push(global.tmp_e_cards, _e_decks[i][j]);
	}
}
sout(global.tmp_e_cards);
// change room
global.room_index = 3;
room_goto(global.room_index);
// load encounter with random enemies based off stats