function scr_start_card_discard (id) {
	// add name to discard
	obj_start_discard.discard[obj_start_discard.discard_size] = obj_player.hand[id.hand_position][0];
	obj_start_discard.discard_size ++;
	instance_destroy(id);
	return;
}