/// @description decrement through revealed deck
if (deck_reveal) {
	var _above_hand_y = player.y-sprite_height-deck_reveal_spacing;
	if (mouse_y <= _above_hand_y  || mouse_y >= _above_hand_y-sprite_height) {
		if (deck_reveal_offset>deck_visable-player.deck_size) deck_reveal_offset --;
	}
}