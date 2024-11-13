/// @description step

if (instance_exists(player)) { // TF // only step if player exists
	// move towards origin
	if (point_distance(x,y,des_x,des_y) > path_speed) move_towards_point(des_x,des_y,path_speed);
	else {
		speed = 0;
		x = des_x;
		y = des_y;
	}
	// mouse over card
	if (is_mouse_over_card()) {
		// temporary fix to overlay // WoL
		var _overlay_fix = false;
		if (instance_exists(player)) {
			if (instance_exists(player.deck)) {
				if (player.deck.deck_reveal == false) _overlay_fix = true;
			}
			else _overlay_fix = true;
		}
		else _overlay_fix = true;
		// if deck is revealed or doesn't exist
		if (_overlay_fix) {
			if (mouse_check_button_pressed(mb_left)) {
				// press [ mouse left ] // make card dragable
				if (global.phase_c_place) {
					if (x == des_x && y == des_y && obj_encounter_system.alarm[0] == -1) dragable = true;
				}
				// press [ mouse left ] // toggle selection ( if not targeting )
				else if (card_stats != {} && x == des_x && y == des_y && !act_ability_target) {
					
					
					if ((global.phase_e_act && global.phase_react && card_stats.reaction && !act_ability) || (global.phase_c_act && (!act_ability || !act_move))){
						selected = !selected;
						// don't allow selection if a revealed zone is active
						if (instance_exists(player.deck) && selected) {
							if (player.deck.deck_reveal) selected = false;
						}
						if (instance_exists(player.discard) && selected) {
							if (player.discard.discard_reveal) selected = false;
						}
						if (selected) card_unselect_hand(player); // unselect cards in hand
					}
				}
			}
			// press [ mouse right ] // toggle ability
			else if (selected && mouse_check_button_pressed(mb_right)) {
				if (card_stats != {} && !act_ability) {
					if (card_stats.target && !act_ability_target) {
						//sout("opt 1");
						// seek target
						act_ability_target = true;
					}
					// activate ability
					else if (!act_ability_target && ((global.phase_c_act && !card_stats.reaction) || (global.phase_e_act && card_stats.reaction))) {
						//sout("opt 2");
						// activate ability
						card_stats.play_script(id);
					}
					// toggle off targeting
					else if (act_ability_target) character_unselect();
				}
			}
			// hold [ mouse right ] // visual spoiler
			else if (mouse_check_button(mb_right) && !act_ability_target) {
				if (card_stats != {}) {
					if (act_ability) card_hq.sprite_index = card_stats.image_hq_back;
					else card_hq.sprite_index = card_stats.image_hq_front;
					card_hq.visible = true;
				}
			}
			else {
				card_hq.sprite_index = spr_card_hq;
				card_hq.visible = false;
			}
		}	
	}
	// release [ mouse left ] // stop draging card
	if (mouse_check_button_released(mb_left) && dragable) dragable = false;
	// reset depth upon returning to start
	if (!dragable && depth != temp_depth && x == des_x && y == des_y) depth = temp_depth;
	// move character
	if (
	keyboard_check_pressed(65) || keyboard_check_pressed(87) || keyboard_check_pressed(68) || keyboard_check_pressed(83) ||
	keyboard_check_pressed(37) || keyboard_check_pressed(38) || keyboard_check_pressed(39) || keyboard_check_pressed(40)
	) {
		// set modifiers
		var _move_mod = 0;
		if (keyboard_check_pressed(38) || keyboard_check_pressed(87)) _move_mod = -board_cols;
		else if (keyboard_check_pressed(39) || keyboard_check_pressed(68)) _move_mod = 1;
		else if (keyboard_check_pressed(40) || keyboard_check_pressed(83)) _move_mod = board_cols;
		else if (keyboard_check_pressed(37) || keyboard_check_pressed(65)) _move_mod = -1;
		// check if movement conditions are met
		if (selected && !act_move && global.phase_c_act && _move_mod != 0) {
			// get player placement
			var _character_placement = get_character_placement();
			if (
				_character_placement+_move_mod >= 0 && 
				_character_placement+_move_mod < board_size &&
				_character_placement >= 0
			) {
				// validate movement
				if (global.board_c_card[_character_placement+_move_mod] == noone) {
					// remove prior instance of object from field
					global.board_c_card[_character_placement] = noone;
					// do movement
					global.board_c_card[_character_placement+_move_mod] = id;
					des_x = global.board_c_cords[_character_placement+_move_mod][0];
					des_y = global.board_c_cords[_character_placement+_move_mod][1];
					// finish movement
					act_move = true;
					// apply frost
					character_apply_condition_damage("frostbite");
				}
			} 
		}
	}
	//sout(player.character_load);
}

// check for target on left click
if (mouse_check_button_pressed(mb_left) && act_ability_target && card_stats != {}) {
	if (card_stats.target) card_stats.target_script(id);
}
if (card_stats.target && !act_ability_target && card_stats != {}) {
	if (instance_exists(act_ability_target_id)) {
		// do script
		card_stats.play_script(act_ability_target_id, id);
	}
}

// press [ space ] // end activation phase
if ((keyboard_check_pressed(32) || end_c_act_phase) && global.phase_c_act && obj_encounter_system.alarm[6] == -1 && damage_taken == 0) {
	// apply poison
	character_apply_condition_damage("poison");
	// check for poison damage
	var _flag = true; // move to next phase
	for (var i = 0; i < board_size; i++) {
		if (instance_exists(global.board_c_card[i])) {
			with (global.board_c_card[i]) {
				if (damage_taken > 0) _flag = false;
			}
			if (!_flag) break;
		}
	}
	if (_flag) {
		// no poison damage
		end_c_act_phase = false;
		obj_encounter_system.alarm[6] = 1; // no delay
	}
	else end_c_act_phase = true;
}