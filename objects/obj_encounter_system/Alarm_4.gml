/// @description enemy act phase

if (global.phase_e_act) {
	with (e_deck) {
		// stop denoting prior enemy as attacking
		var _prior_enemy = global.board_e_card[max(0,obj_encounter_system.card_placement-1)];
		if (instance_exists(_prior_enemy)) _prior_enemy.attack_animation = false;
		// check if enemy is within bounds
		if (obj_encounter_system.card_placement < enemy_max) {
			var _enemy = global.board_e_card[obj_encounter_system.card_placement];
			if (instance_exists(_enemy)) {
				_enemy.attack_animation = true;
				// do attack animation
				instance_create_depth(_enemy.x, _enemy.y, _enemy.depth+1, obj_particle_card_ripple);
				// activate enemy
				_enemy.card_stats.play_script(_enemy.id);
				_enemy.attack_count = _enemy.attack_count+1;
			}
			// check if this enemy has double strike
			var _has_double_strike = array_contains(_enemy.card_stats.abilities, "double strike");
			if (!(_enemy.attack_count==1 && _has_double_strike)) {
				_enemy.attack_count = 0;
				// end this enemy activation ( and apply poison damage
				_enemy.enemy_apply_condition_damage("poison", _enemy);
				with (obj_encounter_system) {
					// do not loop this method
					card_placement++;
					// skip activations of non-existant enemies
					while (card_placement < enemy_max) {
						if (global.board_e_card[card_placement] == noone) card_placement++;
						else break;
					}
				}
			}
		}
		else if (obj_encounter_system.alarm[5] == -1) {
			if (instance_exists(_prior_enemy)) {
				obj_encounter_system.alarm[5] = _prior_enemy.ani_delay_attack;
			}
			else obj_encounter_system.alarm[5] = 1;
		}
	}
}
/*/ TR //
else if (alarm[5] == -1) {
	alarm[5] = e_deck.card_draw_frame_delay;
}
// TR */