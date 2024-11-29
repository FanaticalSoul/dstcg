/// @description update icon and handle keybinds

// mouse over icon
if 	(is_mouse_over_sprite()) {
	if (mouse_check_button_pressed(mb_left)) {
		// cancel button
		if (obj_start_deck_customizer.deck_size > 0) {
			with (obj_start_deck_customizer) {
				for (var i = 0; i < deck_size; i++) deck[i] = "";
				deck_size = 0;
				deck_offset = 0;
			}
		}
	}
}




/// @description update icon and handle keybinds

var _step_max = 2;
// mouse over icon
if 	(is_mouse_over_sprite()) {
	if (mouse_wheel_up()) {
		step += 1;
		if (step >= _step_max) step = -1;
	}
	else if (mouse_wheel_down()) {
		step -= 1;
		if (step < -1) step = _step_max-1;
	}
}
// update icon
if (step == 0) {
	
}
else if (step == 1) {

}
else sprite_index = spr_menu_start_cancel;
// mouse over icon
if 	(is_mouse_over_sprite()) {
	if (mouse_check_button_pressed(mb_left)) {
		if (step == 0) {
			// cancel button
			if (obj_start_deck_customizer.deck_size > 0) {
				with (obj_start_deck_customizer) {
					for (var i = 0; i < deck_size; i++) deck[i] = "";
					deck_size = 0;
					deck_offset = 0;
				}
			}
		}
		else if (step == 1) {

		}
	}
}