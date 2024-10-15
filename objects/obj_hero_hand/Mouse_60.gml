/// @description Insert description here
if (mouse_y <= y  || mouse_y >= y-sprite_height) {
	if (hand_size > hand_visable) {
		if (hand_offset < (hand_size-hand_visable)/2) {
			hand_offset += 0.5;
		}
	}
}