/// @description handle keybinds

// on [ mouse scroll ] // deck view navigation
if (mouse_y <= deck_reveal_y+sprite_height/2  && mouse_y >= deck_reveal_y-sprite_height/2 && deck_reveal) {
	// increment through deck view
	if (mouse_wheel_up() && deck_reveal_offset<0) deck_reveal_offset ++;
	// decrement through deck view
	if (mouse_wheel_down() && deck_reveal_offset>deck_visable-deck_size) deck_reveal_offset --;
}

// mouse over deck
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

// press [ 1 ]
if (keyboard_check_pressed(1+48)) {
	deck_reveal_offset = 0;
	deck_reveal = !deck_reveal; // toggle reveal state
}

// press [ 2 ] // reveal all cards in deck (TF)
if (keyboard_check_pressed(2+48)) deck_reveal_full = !deck_reveal_full;

/*
// press [ 3 ] // shuffle deck (TF)
if (keyboard_check_pressed(3+48)) deck = scr_start_deck_shuffle(deck,deck_size,true);
*/

// press [ enter ] // draw opening hand
//if (keyboard_check_pressed(13) && alarm[0] == -1) alarm[0] = 1;
