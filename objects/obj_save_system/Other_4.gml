/// @description load game

if (global.room_index == 3) {
	if (!file_exists(file_encounter)) start_new_encounter(global.tmp_e_cards);
	else load_game_encounter();
}
else if (global.room_index == 2) {
	if (file_exists(file_map)) load_game_map();
	else start_new_game();
}