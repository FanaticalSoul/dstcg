/// @description load game

if (global.room_index == 3) {
	if (!file_exists(file_encounter)) start_new_encounter(global.tmp_e_cards);
	else load_game();
}
else if (global.room_index == 2) {
	if (file_exists(file_map)) load_game_test();
	else start_new_game_test();
}