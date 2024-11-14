/// @description get selected option and handle keybinds

// get step ( option selected )
step = 0;
for (var i = 0; i < 3; i++) {
	if (mouse_y+mouse_y_offset>11+i*menu_spacing && mouse_y+mouse_y_offset<29+i*menu_spacing) {
		step = i + 1;
		break;
	}
}
// release [ mouse left ] // go to corrisponding room
if (mouse_check_button_released(mb_left)) {
	if (step == 1) {
		room_goto(1);
	}
	//else if (step == 2 && file_exists(file_data)) {
	else if (step == 2 && file_exists(file_map)) {
		ini_open(file_deck);
		// only load game if a saved deck exists
		if (ini_section_exists("deck")) {
			ini_close();
			//room_goto(3);
			if (file_exists(file_map) && file_exists(file_data)) global.room_index = 3;
			else if (file_exists(file_map) && !file_exists(file_data)) global.room_index = 2;
			room_goto(global.room_index);
		}
		else ini_close();
	}
}