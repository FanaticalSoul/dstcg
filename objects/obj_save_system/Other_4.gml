/// @description load game

//sout("room ",room_get_name(1));


//	//start_new_game_test();

if (global.room_index == 3) {
	if (!file_exists(file_data)) start_new_encounter(global.tmp_e_cards);
	else load_game();
	//if (!file_exists(file_data)) {
	//	start_new_game();
	//}
	//else load_game();
}
else if (global.room_index == 2) {
	if (file_exists(file_map)) load_game_test();
	else start_new_game_test();
}



/*
if (file_exists(file_map) && !file_exists(file_data)) {
	sout("con 1");
	start_new_encounter(["test"]);
	//if (!file_exists(file_data)) {
	//	start_new_game();
	//}
	//else 
	load_game();
}
else if (file_exists(file_map)) {
	sout("con 2");
	load_game_test();
}
else if (file_exists(file_deck)) {
	sout("con 3");
	start_new_game_test();
}
*/