/// @description handle keybinds
// on [ mouse scroll ] // deck view navigation
if (mouse_y <= discard_reveal_y+sprite_height/2  && mouse_y >= discard_reveal_y-sprite_height/2 && discard_reveal) {
	// increment through deck view
	if (mouse_wheel_up() && discard_reveal_offset<0) discard_reveal_offset ++;
	// decrement through deck view
	if (mouse_wheel_down() && discard_reveal_offset>discard_visable-discard_size) discard_reveal_offset --;
}

// mouse over discard // WoL
/*
if (mouse_x >= x-sprite_width /2 && mouse_x <= x+sprite_width /2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	// press [ mouse left ] // draw card from deck
	if (mouse_check_button_pressed(mb_left) && !deck_reveal) {
		// only allow this after hero has been placed and opening hand drawn
		if (alarm[0] != -1) {
			scr_start_card_draw(1);
		}
	}
}
*/
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

