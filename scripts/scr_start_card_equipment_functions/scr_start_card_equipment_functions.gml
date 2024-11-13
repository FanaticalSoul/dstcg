function scr_equipment_remant_of_humanity_1 (_id) {
	with (_id) {
		if (global.phase_c_act) {
			if (!player.act_use_equip) {
				with (player) {
					start_card_discard(discard, _id);
					start_card_draw(deck);
				}
				player.act_use_equip = true;
			}
		}
	}
}

function scr_basic_attack (act_num = 1, card_id = id) {
	// do basic attack
	with (card_id) {
		if (global.phase_c_act && !player.act_attack) {
			scr_resolve_attack(act_num, card_id);
		}
	}
}

function scr_basic_block (act_num = 1, card_id = id) {
	with (card_id) {
		var _block = card_stats[act_num].block;
		var _standard_action = card_stats[act_num].standard_action;
		var _stamina = card_stats[act_num].stamina;
		if (global.phase_react) {
			with (player.deck) {
				// pay for action 
				if (player.pay_stamina) {
					// successful payment
					sout("do stamina payment");
					if (!(scr_stamina_cost (player.selection_stamina, _stamina) > 0)) {
						// effect
						scr_start_card_block(_block);
						// post stamina code
						player.pay_stamina = scr_post_effect (_id, _standard_action);
						global.phase_react = false;
					}
				}
				else player.pay_stamina = true;
			}
		}
	}
}

function scr_basic_heal (_id) {
	var _heal = heal;
	var _standard_action = standard_action;
	var _stamina = stamina;
	if (global.phase_c_act && !_id.player.act_use_equip) {
		with (_id.player.deck) {
			// pay for action 
			if (player.pay_stamina) {
				// successful payment
				if (!(scr_stamina_cost (player.selection_stamina, _stamina) > 0)) {
					// effect
					scr_start_card_heal(_heal, player);
					// post stamina code
					player.pay_stamina = scr_post_effect(_id, _standard_action);
					player.act_use_equip = true;
				}
			}
			else player.pay_stamina = true;
		}
	}
	// unselect card
	//scr_start_card_unselect();
	return;
}

function scr_start_card_block (_block) {
	var _character = player.character;
	_character.damage_taken = max(0,_character.damage_stack-_block);
	_character.damage_stack = 0;
	
	// resolve conditions on player
	for (var i = 0; i < array_length(_character.condition_stack); i++) {
		var _condition = _character.condition_stack[i];
		if (!array_contains(_character.conditions, _condition)) {
			array_push(_character.conditions, _condition);
		}
	}
	_character.condition_stack = [];
	// unselect card
	//scr_start_card_unselect();
}

// non-ranged attack
function scr_resolve_attack (act_num, card_id) {
	with (card_id) {
		// valid target
		var _flag = true;
		// get character card placement
		var _character_placement = undefined;
		var _enemy_placement = undefined;
		for (var i = 0; i < board_size; i++) {
			if (global.board_c_card[i] == player.character.id) {
				_character_placement = i;
				break;
			}
		}
		if (_character_placement != undefined) {
			// check if character is blocking view
			if (_character_placement+board_cols<board_size) {
				if (instance_exists(global.board_c_card[_character_placement+board_cols])) {
					// there is a character blocking the view
					_flag = false;
				}
			}
			// get enemies in the same column as the character
			var _column_enemies = get_enemy_cards_in_col(_character_placement);
			// TF
			var _target_enemy = noone;
			// Figure out what enemy in the column is a legal target // WoL
			if		(instance_exists(_column_enemies[0])) _target_enemy = _column_enemies[0];
			else if (instance_exists(_column_enemies[1])) _target_enemy = _column_enemies[1];
			// if valid attack ( so far )
			if (instance_exists(_target_enemy) && _flag) {
				// pay for attack 
				if (player.pay_stamina) {
					var _stamina = card_stats[act_num].stamina;
					var _damage = card_stats[act_num].damage;
					var _attack = card_stats[0].attack;
					var _standard_action = card_stats[act_num].standard_action;
					var _inflict = card_stats[act_num].inflict;
					// successful payment
					if (!(scr_stamina_cost (player.selection_stamina, _stamina) > 0)) {
						// show target
						sout("targeting "+string(_target_enemy.card_stats.name));
						// resolve basic attack
						var _damage_dealt = 0;
						if (_target_enemy.card_stats.weakness == _attack) {
							// get around the defence of the enemy
							_damage_dealt = _damage;
						}
						else {
							_damage_dealt = max(_damage-_target_enemy.card_stats.defense_value,0);
						}
						// inflict conditions
						enemy_apply_conditions(_inflict, _target_enemy);
						// inflict wounds
						_target_enemy.wounds += _damage_dealt;
						// trigger wound / death check
						if (_target_enemy.alarm[1] == -1) _target_enemy.alarm[1] = 1;
						// post effect
						player.pay_stamina = scr_post_effect(id, _standard_action);
						player.act_attack = true;
						// apply stagger ( this takes place here due to how damage works )
						with (player.character) character_apply_condition_damage("stagger");
					}
				}
				else player.pay_stamina = true;
			}
		}
	}
	return;
}


function scr_stamina_cost (_selection_stamina, _stamina_cost) {
	var _total_stamina = [0,0,0,0];
	for (var i = 0; i < array_length(_selection_stamina); i++) {
		var _card_stats = _selection_stamina[i].card_stats;
		for (var j = 0; j < array_length(_total_stamina); j++) {
			_total_stamina[j] += _card_stats[1].stamina[j];
			if (array_length(_card_stats) == 3) _total_stamina[j] += _card_stats[2].stamina[j];
		}
	}
	// pay cost
	var i = 0;
	while (i < array_length(_total_stamina) && (_stamina_cost[0] > 0 || 
	_stamina_cost[1] > 0 || _stamina_cost[2] > 0 || _stamina_cost[3] > 0 ||
	_stamina_cost[4] > 0)) {
		if (_total_stamina[i] > 0) {
			while (_total_stamina[i] > 0 && _stamina_cost[i] > 0) {
				// pay normal cost
				_total_stamina[i] --;
				_stamina_cost[i] --;
			}
			while (_total_stamina[i] > 0 && _stamina_cost[4] > 0) {
				// pay generic cost
				_total_stamina[i] --;
				_stamina_cost[4] --;
			}
		}
		i++;
	}
	var _stamina_cost_remaining = 0;
	for (i = 0; i < array_length(_stamina_cost); i++) {
		_stamina_cost_remaining += _stamina_cost[i];
	}
	return _stamina_cost_remaining;
}

function scr_post_effect (card_id, _standard_action) {
	// discard equipment
	if (_standard_action) {
		start_card_discard (player.discard, card_id);
	}
	// discard stamina
	while (array_length(player.selection_stamina)>0) {
		start_card_discard (player.discard, player.selection_stamina[0]);
	}
	// TF
	// unselect this equipment
	start_card_unselect(card_id);
	// exit payment state
	return false;
}

function get_enemy_cards_in_col (character_placement) {
	// check if enemy is in the same collumn and is valid
	var _column_enemies = [noone, noone];
	for (var i = 0; i < array_length(global.board_e_card); i++) {
		if (instance_exists(global.board_e_card[i])) {
			with (global.board_e_card[i]) {
				// do visibility check
				if (!is_invisible()) {
					if (placement%board_cols == character_placement%board_cols) {
						if (placement<board_cols) _column_enemies[0] = id;
						else _column_enemies[1] = id;
					}
				}
			}
		}
	}
	return _column_enemies;
}





/*
var _name = name;
var _area_of_effect = area_of_effect; // an array of structures if true
var _standard_action = standard_action; // discard on use
//var _block = block;
var _damage = damage;
//var _heal = heal;
//var _search = search;
var _shift = shift;
var _push = push;
var _ranged = ranged; // how does this work in relation to aoe?
//var _dodge = dodge; 
var _attack = attack; // heavy, precise, magical, skilled, none
var _inflict = inflict; // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
var _stamina = stamina; // stamina cost
*/