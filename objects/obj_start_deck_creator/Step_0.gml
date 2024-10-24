/// @description handle keybinds
// on [ mouse scroll ] // hand view navigation // no x-range // WoL
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 && deck_size > cards_visable) {
	var _hidden_cards = deck_size-cards_visable;
	if (mouse_wheel_up()   && deck_offset <  _hidden_cards/2) deck_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && deck_offset > -_hidden_cards/2) deck_offset -= 0.5; // decrement hand view
}
