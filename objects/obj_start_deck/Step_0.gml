/// @description handle keybinds

if (instance_exists(player)) { // TF // only step if player exists
	// on [ mouse scroll ] // deck view navigation
	if (is_mouse_over_reveal(start_deck_reveal_cords[0], start_deck_reveal_cords[1]) && deck_reveal) {
		// increment through deck view
		if (mouse_wheel_up() && deck_reveal_offset<0) deck_reveal_offset++;
		// decrement through deck view
		if (mouse_wheel_down() && deck_reveal_offset>deck_visable-deck_size) deck_reveal_offset--;
	}
	// mouse over deck
	if (is_mouse_over_card()) {
		// press [ mouse left ]
		if (mouse_check_button_pressed(mb_left)) {
			// don't take mulligan
			if (global.phase_mulligan) {
				// go to next phase of game
				with (obj_encounter_system) {
					if (alarm[1] == -1) alarm[1] = 1;
				}
			}
			// resolve damage //
			else if (player.character.damage_taken > 0 && deck_size > 0) {
				//scr_start_card_stamina_discard (id); // TF
				start_card_mill (); // mill card
				player.character.damage_taken --;
			}
		}
	}
	// toggle reveal off if targeting
	if (player.act_equip_target || player.character.act_ability_target) {
		deck_reveal_offset = 0;
		deck_reveal = false; // toggle off reveal state
	}
	// press [ Q ] // toggle deck reveal area
	else if (keyboard_check_pressed(81) && (deck_reveal || deck_size > 0) && !player.character.selected) {
		with (player.discard) if (discard_reveal) discard_reveal = false;
		deck_reveal_offset = 0;
		deck_reveal = !deck_reveal;
	}
	/*
	// press [ alt ] // reveal all cards in deck // (TF)
	if (keyboard_check_pressed(164) || keyboard_check_pressed(165)) deck_reveal_full = !deck_reveal_full;
	*/
}