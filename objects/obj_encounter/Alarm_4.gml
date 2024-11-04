/// @description enemy act phase
if (global.phase_e_act) {
	with (e_deck) {
		// stop denoting prior enemy as attacking
		var _prior_enemy = enemy_card[max(0,obj_encounter.card_placement-1)];
		if (instance_exists(_prior_enemy)) _prior_enemy.attack_animation = false;
		// check if enemy is within bounds
		if (obj_encounter.card_placement < enemy_max) {
			var _enemy = enemy_card[obj_encounter.card_placement];
			if (instance_exists(_enemy)) {
				_enemy.attack_animation = true;
				// do attack animation
				instance_create_depth(_enemy.x, _enemy.y, _enemy.depth+1, obj_particle_card_ripple);
				// activate enemy
				_enemy.card_stats.play_script(_enemy.id);
			}
			// do not loop this method
			obj_encounter.card_placement += 1;
		}
		else if (obj_encounter.alarm[5] == -1) {
			if (instance_exists(_prior_enemy)) {
				obj_encounter.alarm[5] = _prior_enemy.attack_animation_speed;
			}
			else obj_encounter.alarm[5] = 1;
		}
	}
}
/*/ TR //
else if (alarm[5] == -1) {
	alarm[5] = e_deck.card_draw_frame_delay;
}
// TR */