/// @description Insert description here
// You can write your code in this editor
with (obj_start_deck_creator) {
	if (deck_size == deck_min) {
		save_start_deck(deck);
		global.new_game = true;
		room_goto(2);
	}
}