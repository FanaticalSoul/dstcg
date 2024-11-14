/// @description load game

//sout("room ",room_get_name(1));


/*
if (!file_exists(file_data)) {
	//start_new_game_test();
	start_new_game();
}
else load_game();
*/
if (!file_exists(file_map)) {
	start_new_game_test();
}
else load_game_test();
