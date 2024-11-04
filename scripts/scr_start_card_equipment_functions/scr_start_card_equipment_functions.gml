function scr_equipment_remant_of_humanity_1 (_id) {
	with (_id) {
		if (global.phase_c_act) {
			if (!player.act_use_equip) {
				with (player.deck) {
					with (discard) scr_start_card_discard(_id);
					scr_start_card_draw ();
				}
				player.act_use_equip = true;
			}
		}
	}
	return;
}

function scr_equipment_talisman_2 (_id) {
	// work on later // test later
	var _heal = heal;
	var _standard_action = standard_action;
	var _stamina = stamina;
	with (_id) {
		if (global.phase_c_act) {
			if (!player.act_use_equip) {
				with (player.deck) {
					// pay for action 
					if (player.pay_stamina) {
						// successful payment
						if (!(scr_stamina_cost (player.stamina_selection, _stamina) > 0)) {
							// effect
							scr_start_card_heal(_heal);
							// post stamina code
							player.pay_stamina = scr_post_effect(_id, _standard_action);
							player.act_use_equip = true;
						}
					}
					else player.pay_stamina = true;
				}
			}
		}
	}
	return;
}

function scr_equipment_talisman_1 (_id) {
	sout("activated talisman");
	// work on later // test later
	var _block = block;
	var _standard_action = standard_action;
	var _stamina = stamina;
	with (_id) {
		if (global.phase_react) {
			with (player.deck) {
				// pay for action 
				if (player.pay_stamina) {
					// successful payment
					if (!(scr_stamina_cost (player.stamina_selection, _stamina) > 0)) {
						// effect
						scr_start_card_block(_id, _block);
						// post stamina code
						player.pay_stamina = scr_post_effect (_id, _standard_action);
						global.phase_react = false;
					}
				}
				else player.pay_stamina = true;
			}
		}
	}
	return;
}





function scr_equipment_spear_1 (_id) {
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
	// do attack
	if (_area_of_effect != false) return; // do area of effect attack // WoL
	else if (_ranged) return; // do ranged attack // WoL
	else {
		// do basic attack
		with (_id) scr_basic_attack(_id,_name,_standard_action,_damage,_shift,_push,_attack,_inflict,_stamina);
	}
	return;
}



function scr_start_card_block (_id,_block) {
	var _character = _id.player.character_card;
	_character.damage_taken = max(0,_character.damage_stack-_block);
	_character.damage_stack = 0;
	// unselect card
	with (_id) scr_start_card_unselect();
	return true;
}

// non-ranged attack
function scr_basic_attack (_id,_name,_standard_action,_damage,_shift,_push,_attack,_inflict,_stamina) {
	if (global.phase_c_act) {
		if (!player.act_attack) {
			// valid target
			var _flag = true;
			// get character card placement
			var _character_placement = undefined;
			var _enemy_placement = undefined;
			for (var _i = 0; _i < board_size; _i++) {
				if (player.board_card[_i] == player.character_card.id) {
					_character_placement = _i;
					break;
				}
			}
			if (_character_placement != undefined) {
				// check if character is blocking view
				if (_character_placement+board_cols<board_size) {
					if (player.board_card[_character_placement+board_cols] != noone) {
						// there is a character blocking the view
						_flag = false;
					}
				}
				// check if enemy is in the same collumn and is valid
				// this validation needs to take into account invisiblity
				// get enemies in the same column as the character
				var _column_enemies = [noone, noone];
				for (var i = 0; i < array_length(obj_enemy_deck.enemy_card); i++) {
					// this is messed up because of the sort method
					var _enemy = obj_enemy_deck.enemy_card[i];
					//sout("placements");
					if (instance_exists(_enemy)) {
						if (_enemy.placement%board_cols == _character_placement%board_cols) {
							if (_enemy.placement<board_cols) _column_enemies[0] = _enemy;
							else _column_enemies[1] = _enemy;
						}
					}
				}
				// TF
				var _target_enemy = noone;
				// Figure out what enemy in the column is a legal target // WoL
				if (_column_enemies[0] != noone) _target_enemy = _column_enemies[0];
				else if (_column_enemies[1] != noone) _target_enemy = _column_enemies[1];
				// if valid attack ( so far )
				if (_target_enemy != noone && _flag) {
					// pay for attack 
					if (player.pay_stamina) {
						// successful payment
						if (!(scr_stamina_cost (player.stamina_selection, _stamina) > 0)) {
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
							_target_enemy.wounds += _damage_dealt;
							//sout(_target_enemy.wounds);
							if (_target_enemy.wounds >= _target_enemy.card_stats.hit_points) {
								if (_target_enemy.card_stats.regenerate) {
									_target_enemy.wounds = 0;
									_target_enemy.card_stats.regenerate = false; // fix // WoL
									// remove status conditions
									_target_enemy.conditions = []; // remove all conditions
									// fix this as maybe in the future encountering a new instance of this card
									// might cause the card to have no regeneration
								}
								// destroy the card ( use the destroy method to handle this )
								else instance_destroy(_target_enemy);
							}
							// post effect
							player.pay_stamina = scr_post_effect (id, _standard_action);
							player.act_attack = true;
						}
					}
					else player.pay_stamina = true;
				}
			}
		}
	}
	return;
}


function scr_stamina_cost (_stamina_selection,_stamina_cost) {
	var _total_stamina = [0,0,0,0];
	for (var i = 0; i < array_length(_stamina_selection); i++) {
		var _card_stats = _stamina_selection[i].card_stats;
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

function scr_post_effect (_id, _standard_action) {
	// discard equipment
	if (_standard_action) {
		//with player.deck.discard scr_start_card_discard(_id); // TR
		scr_start_card_stamina_discard (_id); // TF
	}
	// discard stamina
	while (array_length(player.stamina_selection)>0) {
		scr_start_card_stamina_discard (player.stamina_selection[0]);
	}
	// TF
	// unselect this equipment
	scr_start_card_unselect ();
	// exit payment state
	return false;
}