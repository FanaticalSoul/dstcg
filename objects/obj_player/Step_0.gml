/// @description handle keybinds

// on [ mouse scroll ] // hand view navigation
if (mouse_y <= y+sprite_height/2  && mouse_y >= y-sprite_height/2 && hand_size > hand_size_visable) {
	var _hidden_cards = hand_size-hand_size_visable;
	if (mouse_wheel_up()   && hand_offset <  _hidden_cards/2) hand_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && hand_offset > -_hidden_cards/2) hand_offset -= 0.5; // decrement hand view
}

// press [ enter ] // draw opening hand
if (keyboard_check_pressed(13) && alarm[0] == -1) alarm[0] = 1;

// press [ 3 ] // shuffle deck (TF)
if (keyboard_check_pressed(3+48)) deck = scr_deck_shuffle(deck,deck_size,true);

// press [ 4 ] // restart game (TF)
if (keyboard_check_pressed(4+48)) game_restart();



// press [ 5 ] // set card stats (TF)
/*
if (keyboard_check_pressed(5+48)) {
	scr_start_card_stats_set ();
	
}
*/