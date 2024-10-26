/// @description Insert description here
// You can write your code in this editor
with (obj_start_deck_creator) {
	deck_size = 0;
	var _i = 0;
	for (var _j = 0; _j < 11; _j++) deck[_i++] = "fth stamina";
	for (var _j = 0; _j <  4; _j++) deck[_i++] = "int stamina";
	for (var _j = 0; _j <  4; _j++) deck[_i++] = "str stamina";
	for (var _j = 0; _j <  2; _j++) deck[_i++] = "herald armour";
	for (var _j = 0; _j <  2; _j++) deck[_i++] = "talisman";
	for (var _j = 0; _j <  3; _j++) deck[_i++] = "spear";
	for (var _j = 0; _j <  2; _j++) deck[_i++] = "kite shield";
	deck_size = _i;
	array_sort(deck,false);
	deck_offset = 0;
}