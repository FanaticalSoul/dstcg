/// @description handle keybinds

// on [ mouse scroll ] // hand view navigation // no x-range // WoL
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 && hand_size > hand_visable) {
	var _hidden_cards = hand_size-hand_visable;
	if (mouse_wheel_up()   && hand_offset <  _hidden_cards/2) hand_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && hand_offset > -_hidden_cards/2) hand_offset -= 0.5; // decrement hand view
}