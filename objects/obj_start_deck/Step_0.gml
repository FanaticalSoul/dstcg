/// @description handle keybinds
// on [ mouse scroll ] // deck view navigation
if (mouse_y <= deck_reveal_y+card_height/2 && mouse_y >= deck_reveal_y-card_height/2 && 
mouse_x <= deck_reveal_x+card_spacing+deck_visable*(card_width+card_spacing)
&& mouse_x >= deck_reveal_x && deck_reveal) {
	// increment through deck view
	if (mouse_wheel_up() && deck_reveal_offset<0) deck_reveal_offset ++;
	// decrement through deck view
	if (mouse_wheel_down() && deck_reveal_offset>deck_visable-deck_size) deck_reveal_offset --;
}
// mouse over deck
if (scr_mouse_over_card()) {
	// press [ mouse left ] // don't take mulligan
	if (mouse_check_button_pressed(mb_left) && player.muligan_phase) {
		with player if (alarm[2]==-1) alarm[2] = 1; // go to next phase of game
	}
}
// press [ up on d-pad ] // toggle deck reveal area
if (keyboard_check_pressed(38) && (deck_reveal || deck_size > 0) && !discard.discard_reveal) {
	deck_reveal_offset = 0;
	deck_reveal = !deck_reveal; // toggle reveal state
}
// press [ down on d-pad ]
if (keyboard_check_pressed(40) && deck_reveal) {
	deck_reveal_offset = 0;
	deck_reveal = false;
}
// press [ alt ] // reveal all cards in deck // (TF)
if (keyboard_check_pressed(164) || keyboard_check_pressed(165)) deck_reveal_full = !deck_reveal_full;