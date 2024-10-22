function scr_sout_last_key () {
	if (keyboard_lastkey != vk_nokey) {
		show_debug_message(string(keyboard_lastkey));
	    keyboard_lastkey = vk_nokey;
	}
}

function scr_mouse_over_card () {
	if (mouse_x >= x-SMCARDSIZEX/2 && mouse_x <= x+SMCARDSIZEX/2 &&
	mouse_y >= y-SMCARDSIZEY/2 && mouse_y <= y+SMCARDSIZEY/2) return true;
	else return false;
}