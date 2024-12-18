/// @description handle keybinds

/*
// sort deck
array_sort(deck,false); // don't know if this will slow things down
// if mouse is within selection boundaries
if (is_mouse_over_sde_selection()) {
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
	for (var i = 0; i < cards_visable; i++) {
		if (is_mouse_over_display_card(i)) {
			// get the stats of the card being hovered over
			var _over_card = undefined;
			if (selection_filter = "") _over_card = selection[abs(selection_offset)+i];
			else _over_card = filtered_selection[abs(selection_offset)+i];
			var _over_card_stats = card_get_stats(start_card_stats, _over_card);
			if (is_array(_over_card_stats)) {
				// set the visual spoiler to show the card being hovered over
				visual_spoiler.sprite_index = _over_card_stats[0].image_hq;
				if (!visual_spoiler.visible) visual_spoiler.visible = true;
				// handle various keybinds
				scr_handle_deck_edit (_over_card, _over_card_stats);
			}
			break;
		}
	}
}
// if mouse is within deck boundaries
else if (is_mouse_over_display_deck()) {
	// on [ mouse scroll ] // hand view navigation
	if (deck_size > cards_visable) {
		if (mouse_wheel_up() && deck_offset < 0) deck_offset += 1; // increment hand view
		if (mouse_wheel_down() && deck_offset > -(deck_size-cards_visable)) deck_offset -= 1; // decrement hand view
	}
	// on mouse hover // display card in visual spoiler
	for (var i = 0; i < cards_visable; i++) {
		if (is_mouse_over_display_card(i, 0, sprite_height+view_spacing)) {
			// get the stats of the card being hovered over
			var _over_card = deck[abs(deck_offset)+i];
			var _over_card_stats = card_get_stats(start_card_stats, _over_card);
			if (is_array(_over_card_stats)) {
				// set the visual spoiler to show the card being hovered over
				visual_spoiler.sprite_index = _over_card_stats[0].image_hq;
				if (!visual_spoiler.visible) visual_spoiler.visible = true;
				// handle various keybinds
				scr_handle_deck_edit (_over_card, _over_card_stats);
			}
			break;
		}
	}
}
// hide visual spoiler if not in deck customizer areas
else if (visual_spoiler.visible) {
	with (obj_sdc_selection_character) {
		if (!(y+card_spacing <= mouse_y && mouse_y <= y+sprite_height-card_spacing &&
		x-card_width/2 <= mouse_x && mouse_x <= x+card_width/2)) visual_spoiler.visible = false;
	}
}
// limit equipment cards allowed in a deck to 4 per card
*/




// sort deck
array_sort(deck,false); // don't know if this will slow things down
// if mouse is within selection boundaries
if (is_mouse_over_sde_selection()) {
	// on [ mouse scroll ] // hand view navigation
	var _visible_selection = get_visible_selection(false);
	var _selection_size = array_length(_visible_selection);
	var _cards_visible = min(cards_visable, _selection_size);
	if (selection_filter = "" && _selection_size > _cards_visible) {
		if (mouse_wheel_up() && selection_offset < 0) selection_offset += 1; // increment hand view
		if (mouse_wheel_down() && selection_offset > -(_selection_size-_cards_visible)) selection_offset -= 1; // decrement hand view
	}
	// on mouse hover // display card in visual spoiler
	for (var i = 0; i <_cards_visible; i++) {
		if (is_mouse_over_display_card(i)) {
			// get the stats of the card being hovered over
			var _over_card = _visible_selection[abs(selection_offset)+i];
			var _card_stats = card_get_stats(start_card_stats, _over_card);
			if (array_length(_card_stats)!=0) {
				// set the visual spoiler to show the card being hovered over
				visual_spoiler.sprite_index = _card_stats[0].image_hq;
				if (!visual_spoiler.visible) visual_spoiler.visible = true;
				// handle various keybinds
				handle_deck_adjustment (_over_card, _card_stats, false);
			}
			break;
		}
	}
}
// if mouse is within deck boundaries
else if (is_mouse_over_display_deck()) {
	// on [ mouse scroll ] // hand view navigation
	var _visible_deck = get_visible_deck();
	var _selection_size = array_length(_visible_deck);
	var _cards_visible = min(cards_visable, _selection_size);
	if (_selection_size > _cards_visible) {
		if (mouse_wheel_up() && deck_offset < 0) deck_offset += 1; // increment hand view
		if (mouse_wheel_down() && deck_offset > -(_selection_size-_cards_visible)) deck_offset -= 1; // decrement hand view
	}
	// on mouse hover // display card in visual spoiler
	for (var i = 0; i < _cards_visible; i++) {
		if (is_mouse_over_display_card(i, 0, sprite_height+view_spacing)) {
			// get the stats of the card being hovered over
			var _over_card = _visible_deck[abs(deck_offset)+i];
			var _card_name = _over_card;
			var _card_stats = card_get_stats(start_card_stats, _card_name);
			if (array_length(_card_stats)!=0) {
				// set the visual spoiler to show the card being hovered over
				visual_spoiler.sprite_index = _card_stats[0].image_hq;
				if (!visual_spoiler.visible) visual_spoiler.visible = true;
				// handle various keybinds
				handle_deck_adjustment(_over_card, _card_stats, false);
			}
			break;
		}
	}
}