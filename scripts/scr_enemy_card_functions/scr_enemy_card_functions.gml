
/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_ghru_leaper (struct_id = id) {
	with (struct_id) {
		sout(["checking values",attack,attack_value]);
		enemy_card_basic_attack(attack,attack_value,struct_id);
	}
	//return;
}

/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_irithyllian_beast_hound (struct_id = id) {
	with (struct_id) {
		sout(["checking values",attack,attack_value]);
		enemy_card_basic_attack(attack,attack_value,struct_id);
	}
	//return;
}

/// @function						enemy_card_basic_attack(attack, attack_value, [struct_id]);
/// @param {array<struct>} attack	a collection of attack locations and effects ( WoL to possibily seemlessly integerate AoE attacks )
/// @param {real} attack_value		attack value ( damage being dealt )
/// @param {id} card_id				enemy card id
/// @description					carry out a basic enemy attack

function enemy_card_basic_attack (attack, attack_value, card_id = id) {
	for (var i = 0; i < array_length(attack); i++) {
		// check target position for player
		//var _target_character = obj_player.board_card[attack[i].attack_location-1]; // change obj_player ( WoL )
		var _target_character = global.board_c_card[attack[i].attack_location-1];
		if (!attack[i].area_of_effect) {
			// if attack is not an AoE
			var _row_start = 0;
			// check row for character with highest taunt value
			for (var j = 0; j < board_rows; j++) {
				if (!instance_exists(_target_character)) {
					//_row_start = int64((_attack[_i].attack_location-1)/board_cols)*board_cols;
					_row_start = abs(int64((attack[i].attack_location-1)/board_cols)-j)*board_cols;
					_target_character = character_taunt_check (_target_character, _row_start, obj_player.board_card);
				}
				else break;
			}
		}
		// if target is valid
		if (instance_exists(_target_character)) {
			// do each basic attack listed
			sout(card_id.card_stats.name+" is targeting "+_target_character.card_stats.name);
			//////////////////_target_character.player.hand_offset = 0; // fixes weird offset issue
			// for each attack, allow targeted player to respond once ( if they can )
			// TR // _target_character.player.reaction = true;
			// check if any cards in hand or on field can react
			//reaction_flag = false;
			// they can use their characters reaction ability
			if (_target_character.card_stats.reaction && !_target_character.ability_used) {
				
				global.phase_react = true;
			}
			// 
			else {
				var _hand = _target_character.player.hand;
				// check equipment cards in hand for reaction cards
				for (var j = 0; j < _target_character.player.hand_size; j++) {
					for (var k = 0; k < array_length(_hand[j].card_stats); k++) {
						if (_hand[j].card_stats[0].type = "equipment") {
							if (_hand[j].card_stats[k].reaction) {
								global.phase_react = true;
								break;
							}
						}
					}
				}
			}
			// WoL
			// reaction currently causes too many issues, as I haven't
			// programmed anything for it yet
			//reaction_flag = false; // TF // temp fix for reactions
			if (global.phase_react) {
				// they can use an equipment to react
				//global.phase_react = true;
				sout("the player can react to this attack");
				// resolve damage on player
				_target_character.damage_stack += _attack_value;
				
				// PLAYER REACTION CODE // WoL //
				// take into account _attack_value
				// create a value on character for incoming damage, thats applied instead ( after being revised )
			}
			else {
				sout("the player can\'t react to this attack");
				global.phase_react = false;
				// resolve damage on player
				_target_character.damage_taken += _attack_value;
			}
			
		}
	}
	return;
}


/// @function						character_taunt_check(target_character, attack_value, [struct_id]);
// @param {array<struct>} attack	a collection of attack locations and effects ( WoL to possibily seemlessly integerate AoE attacks )
// @param {real} attack_value		attack value ( damage being dealt )
// @param {id} card_id				enemy card id
// @description					carry out a basic enemy attack

function character_taunt_check (target_character, _row_start, _character_board) {
	var _target_characters = [];
	for (var _k = _row_start; _k < _row_start+board_cols; _k++) {
		// for each column in the current row
		if (_character_board[_k] != noone) {
			// add an existing character
			array_push(_target_characters,_character_board[_k]);
		}
	}
	// if possible targets were found in the same row
	if (array_length(_target_characters) > 0) {
		//_target_character = noone;
		for (var _k = 0; _k < array_length(_target_characters); _k++) {
			// set the target if there is no target currently set
			if (target_character == noone) target_character = _target_characters[_k];
			// replace the target character with a character in the same row that has a higher taunt value
			else if (_target_characters[_k].card_stats.taunt_value > target_character.card_stats.taunt_value) {
				target_character = _target_characters[_k];
			}
		}
	}
	return target_character;
}