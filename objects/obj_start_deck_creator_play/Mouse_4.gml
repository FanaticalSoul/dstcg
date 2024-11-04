/// @description Insert description here
// You can write your code in this editor
with (obj_start_deck_creator) {
	if (deck_size == deck_min) {
		ini_open("start_deck.ini");
		for (var _i = 0; _i < deck_min; _i++) {
			ini_write_string("deck",string(_i),deck[_i]);
		}
		ini_close();
		room_goto(2);
	}
}