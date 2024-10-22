/// @description remove card from hand and unselect card
if (hand_position != -1) {
	// remove card from hand
	array_delete(player.hand,hand_position,1);
	array_delete(player.hand_card,hand_position,1);
	player.hand_size --;
	// move all cards over in hand
	for (var _i = hand_position; _i < player.hand_size; _i++) {
		player.hand_card[_i].hand_position = player.hand_card[_i].hand_position-1;
	}
}
scr_start_card_unselect ();