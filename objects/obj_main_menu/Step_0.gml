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
	else if (step == 2 && file_exists("save_system_test.txt")) {
		ini_open("start_deck.ini");
		// only load game if a saved deck exists
		if (ini_section_exists("deck")) {
			ini_close();
			room_goto(2);
		}
		else ini_close();
	}
}