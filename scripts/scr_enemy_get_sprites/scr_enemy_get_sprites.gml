function scr_enemy_get_sprites(){
	i = 0;
	sprites[i++] = spr_card_back;
	// sprites 01-20 are card level 1
	for (j = 0; j < 20; j++) {
		sprites[i++] = spr_card_enemy_1_test;
	}
	// sprites 21-40 are card level 2
	for (j = 0; j < 20; j++) {
		sprites[i++] = spr_card_enemy_1_test;
	}
	// sprites 41-50 are card level 3
	for (j = 0; j < 20; j++) {
		sprites[i++] = spr_card_enemy_1_test;
	}
	return sprites;
}