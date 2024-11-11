
/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_ghru_leaper (struct_id = id) {
	enemy_card_basic_attack(attack,attack_value,struct_id);
}

/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_irithyllian_beast_hound (struct_id = id) {
	enemy_card_basic_attack(attack,attack_value,struct_id);
}

/// @function						enemy_card_basic_attack(attack, attack_value, [struct_id]);
/// @param {array<struct>} attack	a collection of attack locations and effects ( WoL to possibily seemlessly integerate AoE attacks )
/// @param {real} attack_value		attack value ( damage being dealt )
/// @param {id} card_id				enemy card id
/// @description					carry out a basic enemy attack

function enemy_card_basic_attack (attack, attack_value, card_id = id) {
	for (var i = 0; i < array_length(attack); i++) {
		// check target position for player
		var _target_character = global.board_c_card[attack[i].attack_location-1];
		//sout(global.board_c_card);
		if (!attack[i].area_of_effect) {
			// if attack is not an AoE
			var _row_start = 0;
			// check row for character with highest taunt value
			for (var j = 0; j < board_rows; j++) {
				if (!instance_exists(_target_character)) {
					_row_start = abs(int64((attack[i].attack_location-1)/board_cols)-j)*board_cols;
					_target_character = character_taunt_check (_target_character, _row_start);
				}
				else break;
			}
		}
		// if target is valid
		if (instance_exists(_target_character)) {
			// do each basic attack listed
			//sout(_target_character.character);
			//sout(_target_character.card_stats);
			var _target_card_stats = card_get_stats(character_card_stats, _target_character.character);
			
			// check if any cards in hand or on field can react
			if (_target_card_stats.reaction && !_target_character.act_ability) {
				// player can use their characters reaction ability
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
			// check if reaction phase is active
			if (global.phase_react) {
				sout(card_id.card_stats.name+" is targeting "+_target_card_stats.name+" ( reaction = 1 )");
				// player can use an equipment to react
				//sout(_target_card_stats.name+" can react to this attack");
				// resolve damage on player
				_target_character.damage_stack += attack_value;
			}
			else {
				sout(card_id.card_stats.name+" is targeting "+_target_card_stats.name+" ( reaction = 0 )");
				//sout(_target_card_stats.name+" can\'t react to this attack");
				global.phase_react = false;
				// resolve damage on player
				_target_character.damage_taken += attack_value;
			}
		}
	}
}

/// @function						character_taunt_check(target_character, row_start);
/// @param {id} target_character	the id of a character in the current row
/// @param {real} row_start			start of the row
/// @return							{id}
/// @description					return a character with the highest taunt value in this row

function character_taunt_check (target_character, row_start) {
	var _target_characters = [];
	for (var k = row_start; k < row_start+board_cols; k++) {
		// for each column in the current row
		if (instance_exists(global.board_c_card[k])) {
			// add an existing character
			array_push(_target_characters,global.board_c_card[k]);
		}
	}
	// if possible targets were found in the same row
	if (array_length(_target_characters) > 0) {
		for (var k = 0; k < array_length(_target_characters); k++) {
			// set the target if there is no target currently set
			if (!instance_exists(target_character)) target_character = _target_characters[k];
			// replace the target character with a character in the same row that has a higher taunt value
			else if (_target_characters[k].card_stats.taunt_value > target_character.card_stats.taunt_value) {
				target_character = _target_characters[k];
			}
		}
	}
	return target_character;
}