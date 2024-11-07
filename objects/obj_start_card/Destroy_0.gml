/// @description remove card from hand and unselect card

sout("destroyed card");
// create a remove from hand method
if (hand_position != -1) {
	// remove card from hand
	array_delete(player.hand,hand_position,1);
	player.hand_size --;
	// move all cards over in hand
	for (var i = hand_position; i < player.hand_size; i++) {
		player.hand[i].hand_position = player.hand[i].hand_position-1;
	}
	array_push(player.hand,noone); // add empty card back to hand
}
if (player.pay_stamina && card_stats[0].type == "stamina") scr_start_card_stamina_unselect ();
else scr_start_card_unselect ();