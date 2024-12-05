/// @description update icon and handle keybinds
// mouse over icon
if 	(is_mouse_over_sprite()) {
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
else sprite_index = spr_icon_reset;
// mouse over icon
if 	(is_mouse_over_sprite()) {
	if (mouse_check_button_pressed(mb_left)) {
		if (step > -1) {
			if (characters[step] == "herald") {
				with (obj_start_deck_creator) {
					deck_size = 0;
					var i = 0;
					for (var j = 0; j < 11; j++) deck[i++] = "fth stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "int stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "str stamina";
					for (var j = 0; j <  2; j++) deck[i++] = "herald armour";
					for (var j = 0; j <  2; j++) deck[i++] = "talisman";
					for (var j = 0; j <  3; j++) deck[i++] = "spear";
					for (var j = 0; j <  2; j++) deck[i++] = "kite shield";
					deck_size = i;
					array_sort(deck,false);
					deck_offset = 0;
					// set character card
					obj_sdc_selection_character.selected = "herald";
				}
			}
			else if (characters[step] == "assassin") {
				with (obj_start_deck_creator) {
					deck_size = 0;
					var i = 0;
					for (var j = 0; j < 11; j++) deck[i++] = "dex stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "int stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "str stamina";
					for (var j = 0; j <  2; j++) deck[i++] = "assassin armour";
					for (var j = 0; j <  2; j++) deck[i++] = "kukris";
					for (var j = 0; j <  3; j++) deck[i++] = "estoc"; // 3 copies
					for (var j = 0; j <  2; j++) deck[i++] = "target shield";
					deck_size = i;
					array_sort(deck,false);
					deck_offset = 0;
					// set character card
					obj_sdc_selection_character.selected = "assassin";
				}
			}
			else if (characters[step] == "sorcerer") {
				with (obj_start_deck_creator) {
					deck_size = 0;
					var i = 0;
					for (var j = 0; j < 11; j++) deck[i++] = "int stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "dex stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "fth stamina";
					for (var j = 0; j <  2; j++) deck[i++] = "sorcerer robes";
					for (var j = 0; j <  2; j++) deck[i++] = "mail breaker";
					for (var j = 0; j <  3; j++) deck[i++] = "soul arrow"; // 3 copies
					for (var j = 0; j <  2; j++) deck[i++] = "leather shield";
					deck_size = i;
					array_sort(deck,false);
					deck_offset = 0;
					// set character card
					obj_sdc_selection_character.selected = "sorcerer";
				}
			}
			else if (characters[step] == "knight") {
				with (obj_start_deck_creator) {
					deck_size = 0;
					var i = 0;
					for (var j = 0; j < 11; j++) deck[i++] = "str stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "fth stamina";
					for (var j = 0; j <  4; j++) deck[i++] = "dex stamina";
					for (var j = 0; j <  3; j++) deck[i++] = "knight armour" // 3 copies
					for (var j = 0; j <  2; j++) deck[i++] = "long sword";
					for (var j = 0; j <  2; j++) deck[i++] = "short sword";
					for (var j = 0; j <  2; j++) deck[i++] = "knight shield";
					deck_size = i;
					array_sort(deck,false);
					deck_offset = 0;
					// set character card
					obj_sdc_selection_character.selected = "knight";
				}
			}
		}
		else {
			// reset button
			if (obj_start_deck_creator.deck_size > 0) {
				with (obj_start_deck_creator) {
					for (var i = 0; i < deck_size; i++) deck[i] = "";
					deck_size = 0;
					deck_offset = 0;
				}
			}
			// unselect character
			with (obj_sdc_selection_character) selected = "";
		}
	}
}