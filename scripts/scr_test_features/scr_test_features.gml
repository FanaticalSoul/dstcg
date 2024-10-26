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


function scr_sout (_str, _spacing = " | ") {
	if (is_array(_str)) {
		var _str_out = "";
		for (var _i = 0; _i < array_length(_str); _i++) {
			_str_out += string(_str[_i]);
			if (_i+1 < array_length(_str)) _str_out += _spacing;
		}
		show_debug_message(_str_out);
	}
	else show_debug_message(string(_str));
	//return;
}


function scr_get_stats (_card_name, _card_stats) {
	for (var _i = 0; _i < array_length(_card_stats); _i++) {
		if (struct_get(_card_stats[_i][0],"name") == _card_name) {
			return _card_stats[_i];
		}
	}
	return undefined;
}