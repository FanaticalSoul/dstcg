/// @description load game

if (!file_exists(file_data)) {
	start_new_game_test();
	//TR//start_new_game();
}
else load_game();