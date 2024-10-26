/// @description handle keybinds

// if mouse is within selection boundaries
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 &&
mouse_x >= x && mouse_x <= sprite_width) {
	// on [ mouse scroll ] // hand view navigation
	if (selection_filter = "" && selection_size > cards_visable) {
		if (mouse_wheel_up() && selection_offset < 0) selection_offset += 1; // increment hand view
		if (mouse_wheel_down() && selection_offset > -(selection_size-cards_visable)) selection_offset -= 1; // decrement hand view
	}
	else if (filtered_selection_size > cards_visable) {
		if (mouse_wheel_up() && selection_offset < 0) selection_offset += 1; // increment hand view
		if (mouse_wheel_down() && selection_offset > -(filtered_selection_size-cards_visable)) selection_offset -= 1; // decrement hand view
	}
	// on mouse hover // display card in visual spoiler
	for (var _i = 0; _i < cards_visable; _i++) {
		if (
			mouse_x > card_spacing+_i*(card_width+card_spacing) && 
			mouse_x <= card_width+card_spacing+_i*(card_width+card_spacing) && 
			mouse_y > card_spacing && 
			mouse_y <= card_height+card_spacing
		) {
			// get the stats of the card being hovered over
			var _over_card = undefined;
			if (selection_filter = "") _over_card = selection[abs(selection_offset)+_i];
			else _over_card = filtered_selection[abs(selection_offset)+_i];
			var _over_card_stats = scr_get_stats(_over_card,card_stats);
			if (_over_card_stats != undefined) {
				// set the visual spoiler to show the card being hovered over
				obj_start_deck_creator_spoiler.sprite_index = _over_card_stats[0].image_hq;
				if (!obj_start_deck_creator_spoiler.visible) obj_start_deck_creator_spoiler.visible = true;
				// on [ mouse left  click ] // add card to deck
				if (mouse_check_button_pressed(mb_left)) {
					// check card type and assossiated limits
					if (_over_card_stats[0].type == "equipment" && _over_card != "remant of humanity") {
						var _card_copy_count = 0;
						for (var _j = 0; _j < deck_size; _j ++) {
							if (deck[_j] == _over_card) _card_copy_count ++;
						}
						if (_card_copy_count < 4 && deck_size < deck_min) {
							// add card to deck
							deck[deck_size] = _over_card;
							deck_size++;
						}
					}
					// no limit
					else if (deck_size < deck_min) {
						// add card to deck
						deck[deck_size] = _over_card;
						deck_size++;
					}
				}
				// on [ mouse right click ] // remove card from deck
				else if (mouse_check_button_pressed(mb_right)) {
					// WoL
				}
				// sort deck
				array_sort(deck,false);
			}
			break;
		}
	}
}
else if (mouse_y <= (y+sprite_height+view_spacing)+card_height/2 && 
mouse_y >= (y+sprite_height+view_spacing)-card_height/2 && 
mouse_x >= x && mouse_x <= sprite_width) {
	// sort deck
	array_sort(deck,false);

	// on [ mouse scroll ] // hand view navigation
	if (deck_size > cards_visable) {
		if (mouse_wheel_up() && deck_offset < 0) deck_offset += 1; // increment hand view
		if (mouse_wheel_down() && deck_offset > -(deck_size-cards_visable)) deck_offset -= 1; // decrement hand view
	}
	// on mouse hover // display card in visual spoiler
	//scr_sout("in zone 2");
	for (var _i = 0; _i < cards_visable; _i++) {
		if (
			mouse_x > card_spacing+_i*(card_width+card_spacing) && 
			mouse_x <= card_width+card_spacing+_i*(card_width+card_spacing) && 
			mouse_y > card_spacing+sprite_height+view_spacing && 
			mouse_y <= card_height+card_spacing+sprite_height+view_spacing
		) {
			//scr_sout("over card");
			// get the stats of the card being hovered over
			var _over_card = deck[abs(deck_offset)+_i];
			var _over_card_stats = scr_get_stats(_over_card,card_stats);
			if (_over_card_stats != undefined) {
				// set the visual spoiler to show the card being hovered over
				obj_start_deck_creator_spoiler.sprite_index = _over_card_stats[0].image_hq;
				if (!obj_start_deck_creator_spoiler.visible) obj_start_deck_creator_spoiler.visible = true;
			}
			break;
		}
	}
}
// hide visual spoiler if not in deck customizer areas
else if (obj_start_deck_creator_spoiler.visible) obj_start_deck_creator_spoiler.visible = false;

// limit equipment cards allowed in a deck to 4 per card