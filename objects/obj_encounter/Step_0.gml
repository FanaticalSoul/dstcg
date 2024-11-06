/// @description end phases

// check if game is loading
if (instance_exists(player)) {
	// end damage phase
	if (instance_exists(player.character)) {
		with (player.character) {
			if (global.phase_e_act && !global.phase_react && damage_taken == 0) {
				with (obj_encounter) {
					if (alarm[4] == -1) {
						if (card_placement-1 >= 0) {
							var _prior_enemy = global.board_e_card[card_placement-1];
							if (instance_exists(_prior_enemy)) {
								alarm[4] = _prior_enemy.attack_animation_speed;
							}
							else alarm[4] = 1; // set this to the ripple effect speed // WoL
						}
						else alarm[4] = 1; // set this to the ripple effect speed // WoL
					}
				}
			}
		}
	}
	// press [ enter ] // end reaction phase
	if (global.phase_react && keyboard_check_pressed(13)) {
		//scr_start_card_stamina_unselect()
		with (player) {
			card_unselect();
			with (character) {
				damage_taken = damage_stack;
				damage_stack = 0;
				global.phase_react = false;
			}
		}
	}
}
// TF
/*
if (instance_exists(e_deck)) {
	if (keyboard_check_pressed(13)) {
		with (obj_encounter) {
			alarm[1] = 1;
		}
	}
}
*/


// TF
/*
if (global.destroy_everything_test) {
	layer_destroy_instances ("Instances");
	global.destroy_everything_test = false;
}
*/

// end enemy placement phase after all enemy cards are placed and flipped
if (instance_exists(e_deck)) {
	if (e_deck.deck_size == 0 && global.phase_e_place) {
		var _flag = true;
		for (var i = 0; i < array_length(global.board_e_card); i++) {
			if (instance_exists(global.board_e_card[i])) {
				with (global.board_e_card[i]) {
					// check if card is not on the board
					if (!(
						ani_fin_board && !ani_act_board && x == des_x && y == des_y && // on board
						!ani_act_flip && ani_fin_flip && flip_scale_x == 1 // finished flipping
					)) {
						// if card is
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