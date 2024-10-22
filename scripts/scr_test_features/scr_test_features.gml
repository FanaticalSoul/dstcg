function scr_sout_last_key () {
	if (keyboard_lastkey != vk_nokey) {
		show_debug_message(string(keyboard_lastkey));
	    keyboard_lastkey = vk_nokey;
	}
}

function scr_mouse_over_card () {
	if (mouse_x >= x-card_width/2 && mouse_x <= x+card_width/2 &&
	mouse_y >= y-card_height/2 && mouse_y <= y+card_height/2) return true;
	else return false;
}