function scr_start_game () {
	game_start = true;
	randomize();
	with (obj_start_deck) deck = scr_deck_shuffle (deck, deck_size, true);
	with (obj_enemy_deck) deck = scr_deck_shuffle (deck, deck_size);
	with (obj_start_deck) if (alarm[0] == -1) alarm[0] = 1;
	with (obj_enemy_deck) if (alarm[0] == -1) alarm[0] = 1;
	return;
}