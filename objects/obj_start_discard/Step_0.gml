/// @description handle keybinds
// on [ mouse scroll ] // deck view navigation
if (mouse_y <= discard_reveal_y+sprite_height/2  && mouse_y >= discard_reveal_y-sprite_height/2 && discard_reveal) {
	// increment through deck view
	if (mouse_wheel_up() && discard_reveal_offset<0) discard_reveal_offset ++;
	// decrement through deck view
	if (mouse_wheel_down() && discard_reveal_offset>discard_visable-discard_size) discard_reveal_offset --;
}
// mouse over discard // WoL
if (scr_mouse_over_card()) {
	// press [ mouse left ] // take mulligan
	if (mouse_check_button_pressed(mb_left) && obj_player.muligan_phase) {
		with (obj_player) {
			scr_start_card_mulligan ();
			if (alarm[2] == -1) alarm[2] = 1;
		}
	}
	// press [ mouse left ] // cycle selected cards
	else if (mouse_check_button_pressed(mb_left) && !discard_reveal && !obj_start_deck.deck_reveal
	&& array_length(obj_player.selection) > 0 && !obj_player.action_cycle
	&& obj_player.character_activation_phase) {
		// cycle selected cards
		while (array_length(obj_player.selection) > 0) {
			with (obj_player.selection[0]) {
				scr_start_card_discard(id);
				instance_destroy();
			}
			//array_delete(obj_player.selection,0,1); // TF
			cycle_size ++;
		}
		if (alarm[0] == -1) alarm[0] = 1;
		obj_player.action_cycle = true;
	}
}
// press [ w ] // toggle deck reveal area
if (keyboard_check_pressed(87) && (discard_reveal || discard_size > 0) && !obj_start_deck.deck_reveal) {
	discard_reveal_offset = 0;
	discard_reveal = !discard_reveal; // toggle reveal state
}
// press [ d ]
if (keyboard_check_pressed(83) && discard_reveal) {
	discard_reveal_offset = 0;
	discard_reveal = false;
}