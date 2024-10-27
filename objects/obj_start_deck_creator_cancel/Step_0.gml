/// @description update icon and handle keybinds
// mouse over icon
if 	(mouse_x >= x-sprite_width/2 && mouse_x <= x+sprite_width/2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	if (mouse_wheel_up()) {
		step += 1;
		if (step >= array_length(characters)) step = -1;
	}
	else if (mouse_wheel_down()) {
		step -= 1;
		if (step < -1) step = array_length(characters)-1;
	}
}
// update icon
if (step > -1) {
	if      (characters[step] == "herald"  ) sprite_index = spr_icon_character_herald;
	else if (characters[step] == "assassin") sprite_index = spr_icon_character_assassin;
	else if (characters[step] == "knight"  ) sprite_index = spr_icon_character_knight;
	else if (characters[step] == "sorcerer") sprite_index = spr_icon_character_sorcerer;
	//else sprite_index = spr_menu_start_cancel;
}
else sprite_index = spr_menu_start_cancel;
// mouse over icon
if 	(mouse_x >= x-sprite_width/2 && mouse_x <= x+sprite_width/2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	if (mouse_check_button_pressed(mb_left)) {
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
	}
}