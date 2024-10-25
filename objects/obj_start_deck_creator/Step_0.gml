/// @description handle keybinds

// if mouse is within selection boundaries
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 &&
mouse_x >= x && mouse_x <= sprite_width && selection_size > cards_visable) {
	// on [ mouse scroll ] // hand view navigation
	var _hidden_cards = selection_size-cards_visable;
	if (mouse_wheel_up()   && selection_offset+2 <  _hidden_cards/2) selection_offset += 1; // increment hand view
	if (mouse_wheel_down() && selection_offset+2 > -_hidden_cards/2) selection_offset -= 1; // decrement hand view
	// on mouse hover // display card in visual spoiler
	for (var _i = 0; _i < cards_visable; _i++) {
		if (
			mouse_x > card_spacing+_i*(card_width+card_spacing) && 
			mouse_x <= card_width+card_spacing+_i*(card_width+card_spacing) && 
			mouse_y > card_spacing && 
			mouse_y <= card_height+card_spacing
		) {
			// get the stats of the card being hovered over
			var _over_card = selection[abs(selection_offset)+_i];
			var _over_card_stats = undefined;
			for (var _j = 0; _j < array_length(card_stats); _j++) {
				if (struct_get(card_stats[_j][0],"name") == _over_card) {
					_over_card_stats = card_stats[_j];
					break;
				}
			}
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
			}
			break;
		}
	}
}


scr_sout(deck);

// limit equipment cards allowed in a deck to 4 per card