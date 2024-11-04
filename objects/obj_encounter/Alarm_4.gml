/// @description enemy act phase
if (global.phase_e_act) {
	with (e_deck) {
		if (obj_encounter.card_placement < enemy_max) {
			var _enemy = enemy_card[obj_encounter.card_placement];
			if (instance_exists(_enemy)) {
				// do attack animation
				instance_create_depth(_enemy.x, _enemy.y, _enemy.depth+1, obj_particle_card_ripple);
				// activate enemy
				_enemy.card_stats.play_script(_enemy.id);
				obj_encounter.card_placement += 1;
				// do not loop this method
				/*
				// stop loop if there is a valid reaction
				if (!global.phase_react) {
					obj_encounter.alarm[4] = _enemy.attack_animation_speed; // continue loop
				}
				*/
			}
			else obj_encounter.card_placement += 1;
		}
		else if (obj_encounter.alarm[5] == -1) {
			obj_encounter.alarm[5] = card_draw_frame_delay;
		}
	}
}
else if (alarm[5] == -1) {
	alarm[5] = e_deck.card_draw_frame_delay;
}