/// @description WoL


if (y+card_spacing <= mouse_y && mouse_y <= y+sprite_height-card_spacing &&
x-card_width/2 <= mouse_x && mouse_x <= x+card_width/2) {
	// on [ mouse scroll ] // hand view navigation
	var _selection_size = array_length(card_selection);
	if (_selection_size > cards_visable) {
		if (mouse_wheel_up() && selection_offset < 0) selection_offset += 1; // increment hand view
		if (mouse_wheel_down() && selection_offset > -(_selection_size-cards_visable)) selection_offset -= 1; // decrement hand view
	}

	for (var i = 0; i < min(cards_visable, array_length(card_selection)); i++) {
		var _y = y+card_height/2+card_spacing+(card_height+card_spacing)*i;
		if (_y-card_height/2 <= mouse_y && mouse_y <= _y+card_height/2 &&
		x-card_width/2 <= mouse_x && mouse_x <= x+card_width/2) {
			// get card being hovered over
			var _card = card_selection[i+abs(selection_offset)];
			var _card_name = _card[0];
			var _card_stats = card_get_stats(start_card_stats, _card_name);
			// set the visual spoiler to show the card being hovered over
			visual_spoiler.sprite_index = _card_stats[0].image_hq;
			if (!visual_spoiler.visible) visual_spoiler.visible = true;
			// select or un-select a character class
			if (mouse_check_button_pressed(mb_left)) {
				// add stamina to unique varible in deck editor
				
				
				
				
				
				//var _save_data = get_data_file(file_deck);
				//array_push(_save_data[1].inventory[0], _card);

				//if (selected == _card) selected = "";
				//else selected = _card;
			}
			
			break;
		}
	}
}
