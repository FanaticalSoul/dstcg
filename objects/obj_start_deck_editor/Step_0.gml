/// @description handle keybinds

// sort deck
array_sort(deck,false); // don't know if this will slow things down
// if mouse is within selection boundaries
if (is_mouse_over_sde_selection()) {
	// on [ mouse scroll ] // hand view navigation
	var _visible_selection = get_visible_selection();
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
				handle_deck_adjustment (_over_card, _card_stats);
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
			var _card_name = "";
			if (is_market_card(_over_card)) _card_name = get_market_card_name(_over_card);
			else _card_name = _over_card;
			//sout(_card_name);
			var _card_stats = card_get_stats(start_card_stats, _card_name);
			if (array_length(_card_stats)!=0) {
				// set the visual spoiler to show the card being hovered over
				visual_spoiler.sprite_index = _card_stats[0].image_hq;
				if (!visual_spoiler.visible) visual_spoiler.visible = true;
				// handle various keybinds
				handle_deck_adjustment(_over_card, _card_stats);
			}
			break;
		}
	}
}