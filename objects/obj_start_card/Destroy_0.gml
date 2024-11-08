/// @description remove card from hand and unselect card

if (instance_exists(player)) {
	// call remove from hand method
	remove_from_hand(player);
	// unselect card
	if (player.pay_stamina && card_stats[0].type == "stamina") start_card_stamina_unselect();
	else start_card_unselect();
}