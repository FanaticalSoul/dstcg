/// @description start and end phases

// check if game is loading
if (instance_exists(player)) {
	if (instance_exists(player.character)) {
		// check if no phase is currently active
		if (!global.phase_c_place && !global.phase_mulligan && !global.phase_e_place && 
		!global.phase_e_act && !global.phase_react && !global.phase_c_act) {
			// start mulligan phase ( 2 )
			if (instance_exists(e_deck)) {
				if (player.hand_size == hand_max) {
					var _flag = true;
					for (var i = 0; i < player.hand_size; i++) {
						with (player.hand[i]) if (!(x==des_x && y==des_y)) _flag = false;
						if (!_flag) break;
					}
					// if all cards in hand are correctly positioned
					if (_flag) {
						//
						
						// if no cards have been drawn from the enemy deck
						if (e_deck.deck_size > 0 && get_enemy_count() == 0) {
							// start mulligan phase
							global.phase_mulligan = true;
							sout("phase 2 - mulligans");
							// save game
							//TR//if (global.new_game) {
							with (player) {
								if (
								instance_exists(discard) &&
								instance_exists(deck) &&
								instance_exists(gauges) &&
								instance_exists(character)) {
									save_game(id); // TF
								}
							}
							//TR//}
						}
						else if (e_deck.deck_size == 0 && get_enemy_count() > 0) {
							// start character activation phase
							global.phase_c_act = true;
							sout("phase 5 - character activation");
							save_game(player);
						}
						/*
						else if (global.phase_e_act) {
							// start player activation phase
							sout("here");
							
						}
						*/
					}
				}
			}
		}
		
		
		// end damage phase
		if (global.phase_e_act && !global.phase_react && player.character.damage_taken == 0) {
			with (obj_encounter_system) {
				if (alarm[4] == -1) {
					if (card_placement-1 >= 0) {
						var _prior_enemy = global.board_e_card[card_placement-1];
						if (instance_exists(_prior_enemy)) {
							if (card_placement >= enemy_max && alarm[5] == -1) {
								// player activation
								sout("alarm!");
								alarm[5] = _prior_enemy.ani_delay_attack;
							}
							else alarm[4] = _prior_enemy.ani_delay_attack;
						}
						else if (card_placement >= enemy_max && alarm[5] == -1) {
							// player activation
							sout("alarm!");
							alarm[5] = ani_delay_ripple; 
						}
						else alarm[4] = ani_delay_ripple; // set this to the ripple effect speed // WoL
					}
					else alarm[4] = ani_delay_ripple; // set this to the ripple effect speed // WoL
					/*
					// TF
					if (card_placement >= enemy_max) {
						sout("all cards have attacked");
						if (alarm[5] == -1) alarm[4] = ani_delay_ripple;
					}
					/*
					// TF // WoL
					if (player.hand_size == hand_max && global.phase_e_act && alarm[4] == -1) {
						var _flag = true;
						for (var i = 0; i < player.hand_size; i++) {
							with (player.hand[i]) if (!(x==des_x && y==des_y)) _flag = false;
							if (!_flag) break;
						}
						if (_flag) {
							sout("here");
							global.phase_e_act = false;
						}
					}
					*/
				}
			}
		}
		// press [ space ] // end reaction phase
		if (global.phase_react && keyboard_check_pressed(32)) {
			card_unselect_all(player);
			with (player.character) {
				damage_taken = damage_stack;
				damage_stack = 0;
				// resolve conditions on player
				for (var i = 0; i < array_length(condition_stack); i++) {
					var _condition = condition_stack[i];
					if (!array_contains(conditions, _condition)) {
						array_push(conditions, _condition);
					}
				}
				condition_stack = [];
			}
			global.phase_react = false;
		}
	}
}
// end enemy placement phase after all enemy cards are placed and flipped
if (instance_exists(e_deck)) {
	if (e_deck.deck_size == 0 && global.phase_e_place) {
		var _flag = true;
		for (var i = 0; i < array_length(global.board_e_card); i++) {
			if (instance_exists(global.board_e_card[i])) {
				with (global.board_e_card[i]) {
					// check if enemy card is not on the board and not finished flipping
					if (!(
						ani_fin_board && !ani_act_board && x == des_x && y == des_y && // on board
						!ani_act_flip && ani_fin_flip && flip_scale_x == 1 // finished flipping
					)) {
						// if enemy card is not on the board and not finished flipping
						_flag = false;
						break;
					}
				}
			}
		}
		if (_flag && alarm[3] == -1) {
			alarm[3] = 1; // frames before enemy activations // WoL
		}
	}
}
// output fps (TF) // if low
if (fps < 55 && fps != last_fps_update) {
	if (fps < 10) sout("fps < 10 ( "+string(fps)+" )");
	else if (fps < 20) sout("fps < 20 ( "+string(fps)+" )");
	else if (fps < 30) sout("fps < 30 ( "+string(fps)+" )");
	else if (fps < 40) sout("fps < 40 ( "+string(fps)+" )");
	else if (fps < 50) sout("fps < 50 ( "+string(fps)+" )");
	else if (fps < 55) sout("fps < 55 ( "+string(fps)+" )");
	last_fps_update = fps;
}