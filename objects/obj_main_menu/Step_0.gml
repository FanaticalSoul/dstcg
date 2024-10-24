/// @description get selected option and handle keybinds
// get step ( option selected )
step = 0;
for (var _i = 0; _i < 3; _i++) {
	if (mouse_y+mouse_y_offset>11+_i*menu_spacing && mouse_y+mouse_y_offset<29+_i*menu_spacing) {
		step = _i + 1;
		break;
	}
}
// release [ mouse left ] // go to corrisponding room
if (mouse_check_button_released(mb_left)) {
	if (step == 1) {
		room_goto(2);
	}
	else if (step == 2) {
		room_goto(1);
	}
	else if (step == 3) {
	
	}
	else {
		
	}
}