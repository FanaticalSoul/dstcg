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









function is_mouse_over_reveal (deck_reveal_x, deck_reveal_y) {
	if (mouse_y <= deck_reveal_y+card_height/2 && 
	mouse_y >= deck_reveal_y-card_height/2 && 
	mouse_x <= deck_reveal_x+card_spacing+deck_visable*(card_width+card_spacing)
	&& mouse_x >= deck_reveal_x) return true;
	else return false;
}













function character_apply_conditions (apply_conditions, character_id = id) {
	for (var i = 0; i < array_length(apply_conditions); i++) {
		var _condition = apply_conditions[i];
		with (character_id) {
			// apply push effect
			var _push = string_split(_condition, " ", true, 1);
			if (array_length(_push) == 2 && _push[0] == "push") {
				sout("push "+_push[1]);
				// initalize varibles
				var _character_placement = get_character_placement();
				var _valid_push = [];
				var _move_mod = 0;
				var _against_wall = false;
				if (_push[1] == "n" || _push[1] == "s") {
					var _loc = _character_placement;
					if (_push[1] == "n") {
						// works
						_move_mod = -board_cols;
						_loc += _move_mod;
						_against_wall = (int64(_character_placement/board_cols)==0);
					}
					if (_push[1] == "s") {
						_move_mod = +board_cols;
						_against_wall = (int64(_character_placement/board_cols)==board_rows-1);
					}
					if (!_against_wall) {
						// get the range for the push
						for (var j = max(_loc-1,0); j <= min(_loc+1,board_cols-1); j++) {
							var _offset = j;
							if (_push[1] == "s") _offset += _move_mod;
							if (0<=_offset&&_offset<board_size) {
								if (global.board_c_card[_offset] == noone) {
									array_push(_valid_push, _offset);
								}
							}
						}
					}
					else sout("against wall");
				}
				else if (_push[1] == "e" || _push[1] == "w") {
					if (_push[1] == "e") {
						_move_mod = +1;
						_against_wall = ((_character_placement+1)%board_cols==0&&_character_placement!=0);
					}
					if (_push[1] == "w") {
						_move_mod = -1;
						_against_wall = (_character_placement%board_cols==0);
					}
					// check for valid locations
					if (!_against_wall) {
						// get the range for the push
						var _row = int64(_character_placement/board_cols);
						for (var j = _row-1; j <= _row+1; j++) {
							var _offset = _character_placement+board_cols*j+_move_mod;
							if (0<=_offset&&_offset<board_size) {
								if (global.board_c_card[_offset] == noone) {
									array_push(_valid_push, _offset);
								}
							}
						}
					}
					else sout("against wall");
				}
				// placements
				var _new_placement = -1;
				if (array_length(_valid_push)>1) {
					// pick random push
					var _rand = irandom(array_length(_valid_push)-1);
					_new_placement = _valid_push[_rand];
				}
				else if (array_length(_valid_push)==1) _new_placement = _valid_push[0];
				// validate movement
				if (_new_placement != -1) {
					// remove prior instance of object from field
					global.board_c_card[_character_placement] = noone;
					// do movement
					global.board_c_card[_new_placement] = id;
					des_x = global.board_c_cords[_new_placement][0];
					des_y = global.board_c_cords[_new_placement][1];
				}
			}
			else {
				// if condition doesn't exist
				if (!array_contains(conditions, _condition)) {
					array_push(conditions, _condition);
					sout("applying "+string(_condition)+" to "+character);
				}
			}
		}
	}
}

function enemy_apply_conditions (apply_conditions, card_id = id) {
	for (var i = 0; i < array_length(apply_conditions); i++) {
		var _condition = apply_conditions[i];
		with (card_id) {
			// if condition doesn't exist
			if (!array_contains(conditions, _condition)) {
				array_push(conditions, _condition);
				sout("applying "+string(_condition)+" to "+card_name);
			}
		}
	}
}



function character_apply_damage (apply_damage, character_id = id) {
	with (character_id) damage_taken += apply_damage;
}


function character_stack_conditions (apply_conditions, character_id = id) {
	for (var i = 0; i < array_length(apply_conditions); i++) {
		var _condition = apply_conditions[i];
		with (character_id) {
			// if condition doesn't exist // also stack push effects
			if (!array_contains(conditions, _condition) && !array_contains(condition_stack, _condition)) {
				array_push(condition_stack, _condition);
				sout("stacking "+string(_condition)+" to "+character);
			}
		}
	}
}

function character_stack_damage (apply_damage, character_id = id) {
	with (character_id) damage_stack += apply_damage;
}

function draw_card_conditions (card_id = id) {
	with (card_id) {
		for (var j = 0; j < array_length(conditions); j++) {
			var _condition_counter = noone;
			if (conditions[j] == "poison"   ) _condition_counter = spr_counter_sm_poison;
			if (conditions[j] == "bleed"    ) _condition_counter = spr_counter_sm_bleed;
			if (conditions[j] == "frostbite") _condition_counter = spr_counter_sm_frostbite;
			if (conditions[j] == "stagger"  ) _condition_counter = spr_counter_sm_stagger;
			if (_condition_counter != noone) {
				var _increment_x = card_width/4*j;
				draw_sprite(_condition_counter, -1, x-card_width/2+4+_increment_x, y+card_height/8);
			}
		}
	}
}