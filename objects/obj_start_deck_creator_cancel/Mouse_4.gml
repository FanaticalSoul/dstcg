/// @description Insert description here
// You can write your code in this editor
if (obj_start_deck_creator.deck_size > 0) {
	with (obj_start_deck_creator) {
		for (var _i = 0; _i < deck_size; _i ++) deck[_i] = "";
		deck_size = 0;
		deck_offset = 0;
	}
}