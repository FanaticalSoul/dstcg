/// @function					is_mouse_over_card([card_id]);
/// @param {id} card_id			card being hovered over
/// @description				check if the mouse is over this card
/// @return						{bool}

function is_mouse_over_card(card_id = id) {
	with (card_id) {
		if (mouse_x >= x-card_width/2 && mouse_x <= x+card_width/2 &&
		mouse_y >= y-card_height/2 && mouse_y <= y+card_height/2) return true;
		else return false;
	}
}

/// @function					sout_last_key();
/// @description				display the virtual key value of the last key pressed (TF)

function sout_last_key() {
	if (keyboard_lastkey != vk_nokey) {
		show_debug_message(string(keyboard_lastkey));
	    keyboard_lastkey = vk_nokey;
	}
}

/// @function					sout(value, [spacing]);
/// @param {any} value			value to output
/// @param {string} spacing		string used to seperate an array's values
/// @description				output the given value

function sout(value, spacing = " | ") {
	if (is_array(value)) {
		var _str_out = "";
		for (var i = 0; i < array_length(value); i++) {
			_str_out += string(value[i]);
			if (i+1 < array_length(value)) _str_out += spacing;
		}
		show_debug_message(_str_out);
	}
	else show_debug_message(string(value));
}

/// @function					card_get_stats(card_stats, card_name);
/// @param {array<struct>}		card_stats	card stats that share their type with card_name
/// @param {string} card_name	the name of the card
/// @description				get the stats of named card
/// @return						{struct}

function card_get_stats (card_stats, card_name) {
	for (var i = 0; i < array_length(card_stats); i++) {
		if (is_array(card_stats[i])) {
			if (struct_get(card_stats[i][0],"name") == card_name) {
				return card_stats[i];
			}
		}
		else if (struct_get(card_stats[i],"name") == card_name) {
			return card_stats[i];
		}
	}
	return {};
}

/// @function					get_csc(stamina_cost);
/// @param {real} stamina_cost	stamina cost of an action or effect
/// @description				get converted stamina cost
/// @return						{real}

function get_csc (stamina_cost) {
	var _converted_stamina_cost = 0;
	for (var i = 0; i < array_length(stamina_cost); i++) {
		_converted_stamina_cost += stamina_cost[i];
	}
	return int64(_converted_stamina_cost);
}


//function get_enemy_count (e_deck_id = id) {
function get_enemy_count () {
	var _enemy_count = 0;
	for (var i = 0; i < board_size; i++) {
		if (instance_exists(global.board_e_card[i])) _enemy_count++;
	}
	return _enemy_count;
}