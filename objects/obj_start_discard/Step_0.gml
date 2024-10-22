/// @description handle keybinds
// on [ mouse scroll ] // discard view navigation
if (mouse_y <= discard_reveal_y+card_height/2  && mouse_y >= discard_reveal_y-card_height/2
&& discard_reveal && mouse_x <= discard_reveal_x+card_spacing+discard_visable*(card_width+card_spacing)
&& mouse_x >= discard_reveal_x && discard_reveal) {
	// increment through discard view
	if (mouse_wheel_up() && discard_reveal_offset<0) discard_reveal_offset ++;
	// decrement through discard view
	if (mouse_wheel_down() && discard_reveal_offset>discard_visable-discard_size) discard_reveal_offset --;
}
// mouse over discard
if (scr_mouse_over_card()) {
	// press [ mouse left ] // take mulligan
	if (mouse_check_button_pressed(mb_left) && player.muligan_phase) {
		with (player) {
			scr_start_card_mulligan ();
			if (alarm[2] == -1) alarm[2] = 1;
		}
	}
	// press [ mouse left ] // cycle selected cards
	else if (mouse_check_button_pressed(mb_left) && !discard_reveal && !deck.deck_reveal
	&& array_length(player.selection) > 0 && !player.action_cycle
	&& player.character_activation_phase) {
		// cycle selected cards
		while (array_length(player.selection) > 0) {
			scr_start_card_discard(player.selection[0]);
			cycle_size ++;
		}
		if (alarm[0] == -1) alarm[0] = 1;
		player.action_cycle = true;
	}
}
// press [ w ] // toggle discard reveal area
if (keyboard_check_pressed(87) && (discard_reveal || discard_size > 0) && !deck.deck_reveal) {
	discard_reveal_offset = 0;
	discard_reveal = !discard_reveal; // toggle reveal state
}
// press [ d ] // toggle discard reveal area off
if (keyboard_check_pressed(83) && discard_reveal) {
	discard_reveal_offset = 0;
	discard_reveal = false;
}