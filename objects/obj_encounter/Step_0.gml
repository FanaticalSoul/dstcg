/// @description end phases

// check if game is loading
if (instance_exists(player)) {
	// end damage phase
	with (player.character_card) {
		if (global.phase_e_act && !global.phase_react && damage_taken == 0) {
			with (obj_encounter) {
				if (alarm[4] == -1) {
					var _prior_enemy = e_deck.enemy_card[card_placement-1];
					if (instance_exists(_prior_enemy)) {
						alarm[4] = _prior_enemy.attack_animation_speed;
					}
					else alarm[4] = 1;
				}
			}
		}
	}
	// press [ enter ] // end reaction phase
	if (global.phase_react && keyboard_check_pressed(13)) {
		//scr_start_card_stamina_unselect()
		with (player) {
			scr_card_unselect();
			with (character_card) {
				damage_taken = damage_stack;
				damage_stack = 0;
				global.phase_react = false;
			}
		}
	}
}
// TF
/*
if (global.destroy_everything_test) {
	layer_destroy_instances ("Instances");
	global.destroy_everything_test = false;
}
*/