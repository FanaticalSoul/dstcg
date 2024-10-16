function sout_last_key (){
	if (keyboard_lastkey != vk_nokey) {
		show_debug_message(string(keyboard_lastkey));
	    keyboard_lastkey = vk_nokey;
	}
}

// set macro ( read-only global varible ) to avoid reading nonexistant cards
// #macro HEROCARDCOUNT array_length(sprites)