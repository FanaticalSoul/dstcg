/// @description handle keybinds
// on [ mouse scroll ] // hand view navigation
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 &&
mouse_x >= x && mouse_x <= sprite_width && selection_size > cards_visable) {
	var _hidden_cards = selection_size-cards_visable;
	if (mouse_wheel_up()   && selection_offset+2 <  _hidden_cards/2) selection_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && selection_offset+2 > -_hidden_cards/2) selection_offset -= 0.5; // decrement hand view
}




for (var _i = 0; _i < cards_visable; _i++) {
	if (mouse_x > card_spacing+_i*(card_width+card_spacing) && mouse_x <= card_width+card_spacing+_i*(card_width+card_spacing)
	 && mouse_y > card_spacing && mouse_y <= card_height+card_spacing) {
		if (abs(selection_offset%1)!=0.5) {
			var _tmp_card = selection[abs(selection_offset)+_i];
			//show_debug_message(string(_tmp_card));
			var _sprite = spr_start_card_hq_back;
			for (var _j = 0; _j < array_length(card_stats); _j++) {
				if (struct_get(card_stats[_j][0],"name") == _tmp_card) {
					_sprite = struct_get(card_stats[_j][0],"image_hq");
					break;
				}
			}
			obj_visual_spoiler_test.sprite_index = _sprite;
		}
		break;
	}
}