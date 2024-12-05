/// @description start and end phases

// check if game is loading
if (instance_exists(player)) {
	if (instance_exists(player.character)) {
		// if main phase is active with damage
		if (global.phase_c_act) {
			if (player.character.damage_taken > 0) {
				card_unselect_all(player);
			}
		}
		// check if no phase is currently active
		else if (!phase_active()) {
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
							// save game // TF
							with (player) {
								if (associated_instances_exist()) {
									if (mulligan_candidate(hand)) save_game_encounter(id);
									// skip mulligan phase if mulligan phase is invalid
									else {
										// go to next phase of game
										with (obj_encounter_system) {
											if (alarm[1] == -1) alarm[1] = 1;
										}
									}
								}
							}
						}
						else if (e_deck.deck_size == 0 && get_enemy_count() > 0) {
							// start character activation phase
							global.phase_c_act = true;
							sout("phase 5 - character activation");
							save_game_encounter(player);
						}
						// if there are no enemies left ( game won )
						else if (e_deck.deck_size == 0 && get_enemy_count() == 0) game_won();
					}
				}
				// if no cards in hand
				else if (player.hand_size == 0 && !inital_save) {
					// if no cards have been drawn from the enemy deck
					if (e_deck.deck_size > 0 && get_enemy_count() == 0) {
						//sout("test save")
						// end placement phase
						save_game_encounter(player);
						inital_save = true;
						with (obj_encounter_system) if (alarm[0]==-1) alarm[0] = ani_delay_ripple;
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
								alarm[5] = _prior_enemy.ani_delay_attack; // player activation
							}
							else alarm[4] = _prior_enemy.ani_delay_attack;
						}
						else if (card_placement >= enemy_max && alarm[5] == -1) {
							alarm[5] = ani_delay_ripple; // player activation
						}
						else alarm[4] = ani_delay_ripple; // set this to the ripple effect speed // WoL
					}
					else alarm[4] = ani_delay_ripple; // set this to the ripple effect speed // WoL
				}
			}
		}
		// press [ space ] // end reaction phase
		if (global.phase_react && keyboard_check_pressed(32)) {
			card_unselect_all(player);
			with (player.character) {
				//damage_taken = damage_stack;
				character_apply_damage(damage_stack);
				damage_stack = 0;
				// resolve conditions on player
				character_apply_conditions(condition_stack);
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