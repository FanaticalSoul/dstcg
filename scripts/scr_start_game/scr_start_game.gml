function scr_start_game () {
	obj_start_deck.deck = scr_deck_shuffle (obj_start_deck.deck, obj_start_deck.deck_size, true);
	if (obj_start_deck.alarm[0] == -1) obj_start_deck.alarm[0] = 1;
	obj_enemy_deck.deck = scr_deck_shuffle (obj_enemy_deck.deck, obj_enemy_deck.deck_size);
	if (obj_enemy_deck.alarm[0] == -1) obj_enemy_deck.alarm[0] = 1;
	return;
}