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

function sout (_str, _spacing = " | ") {
	if (is_array(_str)) {
		var _str_out = "";
		for (var _i = 0; _i < array_length(_str); _i++) {
			_str_out += string(_str[_i]);
			if (_i+1 < array_length(_str)) _str_out += _spacing;
		}
		show_debug_message(_str_out);
	}
	else show_debug_message(string(_str));
}


function scr_get_stats (_card_name, _card_stats, _states = true) {
	for (var _i = 0; _i < array_length(_card_stats); _i++) {
		if (_states) {
			if (struct_get(_card_stats[_i][0],"name") == _card_name) {
				return _card_stats[_i];
			}
		}
		else {
			if (struct_get(_card_stats[_i],"name") == _card_name) {
				return _card_stats[_i];
			}
		}
	}
	return undefined;
}

function scr_get_csc (_stamina_cost) {
	// get converted stamina cost
	var _csc = 0;
	for (var i = 0; i < array_length(_stamina_cost); i++) {
		_csc += _stamina_cost[i];
	}
	return _csc;
}

function scr_card_unselect () {
	if (character_card.selected) character_card.selected = false;
	while (array_length(stamina_selection) > 0) {
		with (stamina_selection[0]) scr_start_card_stamina_unselect();
	}
	while (array_length(selection) > 0) {
		with (selection[0]) scr_start_card_unselect();
	}
	return;
}