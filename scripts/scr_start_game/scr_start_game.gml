function scr_start_game () {
	//show_debug_message("before shuffling : "+string(obj_start_deck.deck));
	obj_start_deck.deck = scr_deck_shuffle (obj_start_deck.deck, obj_start_deck.deck_size, true );
	//show_debug_message("after  shuffling : "+string(obj_start_deck.deck));
	if (obj_start_deck.alarm[0] == -1) obj_start_deck.alarm[0] = 1;
	//show_debug_message("before shuffling : "+string(obj_enemy_deck.deck));
	obj_enemy_deck.deck = scr_deck_shuffle (obj_enemy_deck.deck, obj_enemy_deck.deck_size, false);
	//show_debug_message("after  shuffling : "+string(obj_enemy_deck.deck));
	if (obj_enemy_deck.alarm[0] == -1) obj_enemy_deck.alarm[0] = 1;
	return;
}