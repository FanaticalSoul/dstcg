/// @description handle keybinds

if (instance_exists(player)) { // TF // only step if player exists
	// on [ mouse scroll ] // discard view navigation
	if (is_mouse_over_reveal(start_discard_reveal_cords[0], start_discard_reveal_cords[1]) && discard_reveal) {
		// increment through discard view
		if (mouse_wheel_up() && discard_reveal_offset<0) discard_reveal_offset ++;
		// decrement through discard view
		if (mouse_wheel_down() && discard_reveal_offset>discard_visable-discard_size) discard_reveal_offset --;
	}
	// mouse over discard
	if (is_mouse_over_card()) {
		// press [ mouse left ] // take mulligan
		if (mouse_check_button_pressed(mb_left) && global.phase_mulligan) {
			start_card_mulligan(player); // take mulligan
			with (obj_encounter_system) {
				// take mulligan
				if (alarm[1] == -1) alarm[1] = 1;
			}
		}
		// press [ mouse left ] // cycle selected cards
		else if (mouse_check_button_pressed(mb_left) && !discard_reveal && !player.deck.deck_reveal
		&& array_length(player.selection) > 0 && !player.act_cycle
		&& global.phase_c_act && !player.pay_stamina && !player.act_equip_target
		) {
			// cycle selected cards
			while (array_length(player.selection) > 0) {
				//scr_start_card_discard(player.selection[0]);
				start_card_discard(id, player.selection[0]);
				cycle_size ++;
			}
			if (alarm[0] == -1) alarm[0] = 1;
			player.act_cycle = true;
		}
	}
	// toggle reveal off if targeting
	if (player.act_equip_target || player.character.act_ability_target) {
		discard_reveal_offset = 0;
		discard_reveal = false; // toggle off reveal state
	}
	// press [ E ] // toggle discard reveal area
	else if (keyboard_check_pressed(69) && (discard_reveal || discard_size > 0) && !player.character.selected) {
		with (player.deck) if (deck_reveal) deck_reveal = false;
		discard_reveal_offset = 0;
		discard_reveal = !discard_reveal; // toggle reveal state
	}
}