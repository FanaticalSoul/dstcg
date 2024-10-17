function scr_enemy_sprites_set (){
	i = 0;
	sprites[i++] = spr_card_back;
	// sprites 01-20 are card level 1
	for (j = 0; j < 20; j++) {
		var _tmp_var = (j+1)%10;
		if (_tmp_var  ==0) sprites[i++] = spr_card_enemy_1_test;
		else if (_tmp_var%9==0) sprites[i++] = spr_card_9;
		else if (_tmp_var%8==0) sprites[i++] = spr_card_8;
		else if (_tmp_var%7==0) sprites[i++] = spr_card_7;
		else if (_tmp_var%6==0) sprites[i++] = spr_card_6;
		else if (_tmp_var%5==0) sprites[i++] = spr_card_5;
		else if (_tmp_var%4==0) sprites[i++] = spr_card_4;
		else if (_tmp_var%3==0) sprites[i++] = spr_card_3;
		else if (_tmp_var%2==0) sprites[i++] = spr_card_2;
		else if (_tmp_var%1==0) sprites[i++] = spr_card_1;
		else sprites[i++] = spr_card_enemy_1_test;
		//sprites[i++] = spr_card_enemy_1_test;
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