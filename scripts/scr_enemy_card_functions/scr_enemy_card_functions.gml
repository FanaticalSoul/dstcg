/*
/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_ghru_leaper (struct_id = id) {
	enemy_card_basic_attack(attack,attack_value,abilities,struct_id);
}

/// @function					enemy_card_ghru_leaper([struct_id]);
/// @param {id} struct_id		structure id
/// @description				activate an enemy ghru leaper

function enemy_card_irithyllian_beast_hound (struct_id = id) {
	enemy_card_basic_attack(attack,attack_value,abilities,struct_id);
}

function enemy_card_silver_knight_spearman (struct_id = id) {
	enemy_card_basic_attack(attack,attack_value,abilities,struct_id);
}
*/



/// @function						enemy_card_basic_attack([card_id]);
/// @param {id} card_id				enemy card id
/// @description					carry out a basic enemy attack

function enemy_card_basic_attack (card_id = id) {
	with (card_id) {
		// get attack value ( damage being dealt )
		var _attack_value = card_id.card_stats.attack_value;
		var _attacks = card_id.card_stats.attack;
		for (var i = 0; i < array_length(_attacks); i++) {
			var _attack = _attacks[i];
			// check target position for player
			var _target_character = global.board_c_card[_attack.attack_location-1];
			if (!_attack.area_of_effect) {
				// if attack is not an AoE
				var _row_start = 0;
				// check row for character with highest taunt value
				for (var j = 0; j < board_rows; j++) {
					if (!instance_exists(_target_character)) {
						_row_start = abs(int64((_attack.attack_location-1)/board_cols)-j)*board_cols;
						_target_character = character_taunt_check (_target_character, _row_start);
					}
					else break;
				}
			}
			// if target is valid
			if (instance_exists(_target_character)) {
				// apply bleed
				with (_target_character) {
					for (var j = 0; j < array_length(conditions); j++) {
						if (conditions[j] == "bleed") {
							_attack_value += 1; // increase incoming damage
							array_delete(conditions, i, 1);
							break;
						}
					}
				}
				// do each basic attack listed
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
					// make it clear that target player can react to this attack
					sout(card_stats.name+" is targeting "+_target_card_stats.name+" ( reaction = 1 )");
					// resolve damage on player
					character_stack_damage(_attack_value, _target_character);
						// resolve conditions on player
					character_stack_conditions(_attack.conditions, _target_character);
				}
				else {
					// make it clear that target player can not react to this attack
					sout(card_stats.name+" is targeting "+_target_card_stats.name+" ( reaction = 0 )");
					global.phase_react = false;
					// resolve damage on player
					character_apply_damage(_attack_value, _target_character);
					// resolve conditions on player
					character_apply_conditions(_attack.conditions, _target_character);
				}
			}
		}
		//}
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