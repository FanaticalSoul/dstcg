/// @description follow return path


sout("alarm 2 activated");

// remove card from hand and unselect card
/*
if (hand_position != -1) {
	// remove card from hand
	array_delete(player.hand,hand_position,1);
	//array_delete(player.hand_card,hand_position,1);
	player.hand_size --;
	// move all cards over in hand
	for (var i = hand_position; i < player.hand_size; i++) {
		player.hand[i].hand_position = player.hand[i].hand_position-1;
	}
	array_push(player.hand,noone); // add empty card back to hand
}
if (player.pay_stamina && card_stats[0].type == "stamina") scr_start_card_stamina_unselect ();
else scr_start_card_unselect ();
// follow path // WoL
//ani_fin_draw = true;
//ani_act_draw = false;
path_start(pth_start_deck_return,path_speed,path_action_stop,true);
*/
instance_destroy(id);