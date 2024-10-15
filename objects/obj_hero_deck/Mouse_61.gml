/// @description Insert description here
if (deck_reveal) {
	var _above_hand_y = obj_hero_hand.y-sprite_height-deck_reveal_spacing;
	var _cards_revealed = 4;
	if (mouse_y <= _above_hand_y  || mouse_y >= _above_hand_y-sprite_height) {
		if (deck_reveal_offset>_cards_revealed-deck_size) {
			deck_reveal_offset --;
		}
	}
}