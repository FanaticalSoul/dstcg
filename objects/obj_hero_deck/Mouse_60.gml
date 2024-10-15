/// @description Insert description here
if (deck_reveal) {
	var _above_hand_y = obj_hero_hand.y-sprite_height-deck_reveal_spacing;
	if (mouse_y <= _above_hand_y  || mouse_y >= _above_hand_y-sprite_height) {
		if (deck_reveal_offset<0) {
			deck_reveal_offset ++;
		}
	}
}