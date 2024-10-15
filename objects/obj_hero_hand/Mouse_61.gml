/// @description Insert description here
// You can write your code in this editor
if (mouse_y <= y  || mouse_y >= y-sprite_height) {
	if (hand_size > hand_visable) {
		if (hand_offset > 0-(hand_size-hand_visable)/2) {
			hand_offset -= 0.5;
		}
	}
}