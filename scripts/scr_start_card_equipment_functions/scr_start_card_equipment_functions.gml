function scr_equipment_remant_of_humanity_1 (_id) {
	with (_id) {
		if (player.character_activation_phase) {
			if (!player.action_use_equipment) {
				with (player.deck) {
					with (discard) scr_start_card_discard(_id);
					scr_start_card_draw ();
				}
				player.action_use_equipment = true;
			}
		}
	}
	return;
}

function scr_equipment_talisman_2 (_id,_heal) {
	with (_id) {
		if (player.character_activation_phase) {
			if (!player.action_use_equipment) {
				with (player.deck) {
					scr_start_card_heal(_heal);
					player.action_use_equipment = true;
				}
			}
		}
	}
	return;
}


function scr_equipment_spear_1 (_id) {
	var _name = name;
	var _area_of_effect = area_of_effect; // an array of structures if true
	var _standard_action = standard_action; // discard on use
	var _block = block;
	var _damage = damage;
	var _heal = heal;
	var _search = search;
	var _shift = shift;
	var _push = push;
	var _ranged = ranged; // how does this work in relation to aoe?
	var _dodge = dodge; 
	var _attack = attack; // heavy, precise, magical, skilled, none
	var _inflict = inflict; // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
	var _stamina = stamina; // stamina cost
	/*
		// dexerity
		// intelligence
		// strength
		// faith
		// generic
	*/
	with (_id) {
		if (player.character_activation_phase) {
			if (!player.action_attack) {
				/*
				with (player.start_deck) {
					scr_start_card_heal(_heal);
					
				}
				*/
				
				if (_ranged) {
					// WoL
				}
				else {
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
						if (_character_placement+3<board_size) {
							if (player.board_card[_character_placement+3] != noone) {
								// there is a character blocking the view
								_flag = false;
							}
						}
						// check if enemy is in the same collumn and is valid
						// this validation needs to take into account invisiblity
						
						/*
						var _column_enemies = [
							obj_enemy_deck.card_placements[_character_placement%board_cols], // closest enemy
							obj_enemy_deck.card_placements[_character_placement%board_cols+board_cols],
						];
						//scr_sout(obj_enemy_deck.card_placements[_character_placement%board_cols]);
						//scr_sout(obj_enemy_deck.card_placements[_character_placement%board_cols+board_cols]);
						sout("enemies:");
						if (_column_enemies[0] != noone) {
							sout(" - enemy in first column");
						}
						if (_column_enemies[0] != noone) {
							sout(" - enemy in seccond column");
						}
						*/
						
						
						for (var _i = 0; _i < obj_enemy_deck.enemy_count; _i++) {
							sout([obj_enemy_deck.enemy_card[_i].card_stats.name,obj_enemy_deck.enemy_card[_i].placement]);
							//sout(obj_enemy_deck.card_placements[_i]);
							
							/*
							if (obj_enemy_deck.card_placements[_i] != noone) {
								
								sout(obj_enemy_deck.card_placements[_i].name);
								
								with (obj_enemy_deck.card_placements[_i]) {
									if (card_stats != undefined) {
										if (card_stats != noone) sout(card_stats.name);
										else sout("noone");
									}
									else sout("noone");
								}
								
							}
							else sout("noone");
							*/
						}
						/*
						if (_column_enemies[0] != noone) {
							scr_sout(_column_enemies[0].card_stats.name);
						}
						else if (_column_enemies[1] != noone) {
							scr_sout(_column_enemies[1].card_stats.name);
						}
						*/
						
						
					}
					//scr_sout(_character_placement);
				}
				//else if (player.board_card[0]) {
					// is character in front row or not obbscured by another character
					
						//player
				//}
				// check if valid target exists ( if not AoE ) ( selecting a row if ranged )
				
				// checking if a player is infront of the character
				
				
				// pay cost
				
				// do effect
				
				
				
				
				// put card in discard if standard action
				
				// put stamina used in discard
				
				// toggle attack action ( if attack was successfully paid for and excuted correctly )
				// player.action_attack = true;
			}
		}
	}
	return;
}
//function scr_equipment_spear_2 () {}
//function scr_equipment_spear_3 () {}