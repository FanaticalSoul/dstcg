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
	var _flag = false;
	var j = i;
	while (!_flag && j < _treasure_count) {
		// try to validate card
		var _t_card = _t_deck[j];
		var _t_card_count = 0;
		var _rewards = get_data_rewards();
		var _loot = get_data_loot();
		var _inventory = get_data_inventory();
		//
		for (var k = 0; k < array_length(_rewards); k++) {
			if (_rewards[k] == _t_card) _t_card_count++;
		}
		for (var k = 0; k < array_length(_loot); k++) {
			if (_loot[k] == _t_card) _t_card_count++;
		}
		for (var k = 0; k < array_length(_inventory); k++) {
			if (_inventory[k] == _t_card) _t_card_count++;
		}
		if (_t_card_count < 4) _flag = true;
		//
		if (!_flag) j++;
	}
	if (_flag) array_push(_treasures, _t_deck[j]); // add top card
	else sout("unable to add card");
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
set_data_rewards([_treasures, _souls]);
//global.tmp_rewards = [_treasures, _souls];

// change room
global.room_index = 3;
room_goto(global.room_index);
// load encounter with random enemies based off stats