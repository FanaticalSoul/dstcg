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
var _treasure_count = card_get_stats(encounter_card_stats, card_name).encounter[_level-1][1];
// set treasure deck
var _treasure_stats = get_treasure_stats();
var _t_deck = [];
for (var i = 0; i < array_length(_treasure_stats); i++) {
	array_push(_t_deck, _treasure_stats[i][0].name);
}
// add treasures to rewards ( allow duplicates )
var _treasures = [];
for (var i = 0; i < _treasure_count; i++) {
	_t_deck = scr_deck_shuffle(_t_deck,array_length(_t_deck)); // shuffle deck
	array_push(_treasures, _t_deck[0]); // add top card
}
//sout("treasures");
//sout(_treasures);

// add cards to deck
var _souls = 0;
global.tmp_e_cards = [];
for (var i = 0; i < 3; i++) {
	for (var j = 0; j < _encounter[i]; j++) {
		array_push(global.tmp_e_cards, _e_decks[i][j]);
		_souls += int64(card_get_stats(enemy_card_stats, _e_decks[i][j]).souls);
	}
}
//sout(global.tmp_e_cards);
// add souls to rewards
//sout("souls");
//sout(_souls);
save_data_rewards([_treasures, _souls]);

// change room
global.room_index = 3;
room_goto(global.room_index);
// load encounter with random enemies based off stats