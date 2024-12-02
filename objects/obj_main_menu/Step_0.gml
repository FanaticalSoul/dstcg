/// @description get selected option and handle keybinds

// get step ( option selected )
step = 0;
var _load_game_step = 2;
for (var i = 0; i < options; i++) {
	if (mouse_y+mouse_y_offset>11+i*menu_spacing && mouse_y+mouse_y_offset<29+i*menu_spacing) {
		// only allow selection of "load game" if you have a saved file
		if ((file_exists(file_map) && file_exists(file_deck) && i == _load_game_step-1) || i != _load_game_step-1) {
			step = i + 1;
			break;
		}
	}
}
// release [ mouse left ] // go to corrisponding room
if (mouse_check_button_released(mb_left) && !obj_test_sprite_loader.visible) {
	if (step == 1) room_goto(1);
	//else if (step == 2 && file_exists(file_data)) {
	else if (step == 2 && file_exists(file_map) && file_exists(file_deck)) {
		// only load game if a saved deck exists
		if (file_exists(file_encounter)) global.room_index = 3;
		else global.room_index = 2;
		room_goto(global.room_index);
		//else ini_close();
	}
}