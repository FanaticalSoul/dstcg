/// @description Insert description here
if (step > -1) {
	if (characters[step] == "herald") {
		with (obj_start_deck_creator) {
			deck_size = 0;
			var _i = 0;
			for (var _j = 0; _j < 11; _j++) deck[_i++] = "fth stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "int stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "str stamina";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "herald armour";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "talisman";
			for (var _j = 0; _j <  3; _j++) deck[_i++] = "spear";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "kite shield";
			deck_size = _i;
			array_sort(deck,false);
			deck_offset = 0;
		}
	}
	else if (characters[step] == "assassin") {
		with (obj_start_deck_creator) {
			deck_size = 0;
			var _i = 0;
			for (var _j = 0; _j < 11; _j++) deck[_i++] = "dex stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "int stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "str stamina";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "assassin armour";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "kukris";
			for (var _j = 0; _j <  3; _j++) deck[_i++] = "estoc"; // 3 copies
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "target shield";
			deck_size = _i;
			array_sort(deck,false);
			deck_offset = 0;
		}
	}
	else if (characters[step] == "sorcerer") {
		with (obj_start_deck_creator) {
			deck_size = 0;
			var _i = 0;
			for (var _j = 0; _j < 11; _j++) deck[_i++] = "int stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "dex stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "fth stamina";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "sorcerer robes";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "mail breaker";
			for (var _j = 0; _j <  3; _j++) deck[_i++] = "soul arrow"; // 3 copies
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "leather shield";
			deck_size = _i;
			array_sort(deck,false);
			deck_offset = 0;
		}
	}
	else if (characters[step] == "knight") {
		with (obj_start_deck_creator) {
			deck_size = 0;
			var _i = 0;
			for (var _j = 0; _j < 11; _j++) deck[_i++] = "str stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "fth stamina";
			for (var _j = 0; _j <  4; _j++) deck[_i++] = "dex stamina";
			for (var _j = 0; _j <  3; _j++) deck[_i++] = "knight armour" // 3 copies
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "long sword";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "short sword";
			for (var _j = 0; _j <  2; _j++) deck[_i++] = "knight shield";
			deck_size = _i;
			array_sort(deck,false);
			deck_offset = 0;
		}
	}
}
else {
	// cancel button
	if (obj_start_deck_creator.deck_size > 0) {
		with (obj_start_deck_creator) {
			for (var _i = 0; _i < deck_size; _i ++) deck[_i] = "";
			deck_size = 0;
			deck_offset = 0;
		}
	}
}