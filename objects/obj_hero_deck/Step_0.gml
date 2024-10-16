/// @description handle keybinds


// on [ mouse scroll ] // deck view navigation
/*
//if (mouse_y <= y+sprite_height/2  && mouse_y >= y-sprite_height/2 && hand_size > hand_size_visable) {

/// @description increment through revealed deck
if (deck_reveal) {
	var _above_hand_y = player.y-sprite_height-deck_reveal_spacing;
	if (mouse_y <= _above_hand_y  || mouse_y >= _above_hand_y-sprite_height) {
		if (deck_reveal_offset<0) deck_reveal_offset ++;
	}
}
/// @description decrement through revealed deck
if (deck_reveal) {
	var _above_hand_y = player.y-sprite_height-deck_reveal_spacing;
	if (mouse_y <= _above_hand_y  || mouse_y >= _above_hand_y-sprite_height) {
		if (deck_reveal_offset>deck_visable-player.deck_size) deck_reveal_offset --;
	}
}
*/

// mouse over deck
if (mouse_x >= x-sprite_width /2 && mouse_x <= x+sprite_width /2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	// press [ mouse left ] // draw card from deck
	if (mouse_check_button_pressed(mb_left) && !deck_reveal) {
		with (player) scr_draw_hero_card(1);
	}
}

// press [ 1 ]
if (keyboard_check_pressed(1+48)) {
	deck_reveal_offset = 0;
	deck_reveal = !deck_reveal; // toggle reveal state
}

// press [ 2 ] // reveal all cards in deck (TF)
if (keyboard_check_pressed(2+48)) deck_reveal_full = !deck_reveal_full;