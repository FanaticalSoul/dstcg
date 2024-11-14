/// @description load game

//sout("room ",room_get_name(1));


if (global.room_index == 3) {
	start_new_encounter(["test"]);
	/*
	if (!file_exists(file_data)) {
		//start_new_game_test();
		start_new_game();
	}
	else load_game();
	*/
}
else if (global.room_index == 2) {
	if (!file_exists(file_map)) {
		start_new_game_test();
	}
	else load_game_test();
}