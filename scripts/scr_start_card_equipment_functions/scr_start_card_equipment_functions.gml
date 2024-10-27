function scr_equipment_remant_of_humanity_1 (_id) {
	with (_id) {
		if (player.character_activation_phase) {
			if (!player.action_use_equipment) {
				with (player.start_deck.discard) scr_start_card_discard(_id);
				with (player.start_deck) scr_start_card_draw ();
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
				//else if (player.character_card.) {
				//else if (player.board_card[0]) {
					// is character in front row or not obbscured by another character
					
						//player
				//}
				// check if valid target exists ( if not AoE ) ( selecting a row if ranged )
				
				// checking if a player is infront of the character
				
				
				// pay cost
				
				// do effect
				
				scr_sout(_name);
				
				
				
				
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