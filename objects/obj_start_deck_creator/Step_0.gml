/// @description handle keybinds
// on [ mouse scroll ] // hand view navigation // no x-range // WoL
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 &&
mouse_x >= x && mouse_x <= sprite_width && selection_size > cards_visable) {
	var _hidden_cards = selection_size-cards_visable;
	/*
	var _hidden_cards = deck_size-cards_visable;
	if (mouse_wheel_up()  ) deck_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && deck_offset > -_hidden_cards/2) deck_offset -= 0.5; // decrement hand view
	*/
	if (mouse_wheel_up()   && selection_offset <  _hidden_cards/2) selection_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && selection_offset > -_hidden_cards/2) selection_offset -= 0.5; // decrement hand view
	
	
	
	//if (0 < mouse_x && mouse_x < room_width) {
	//visual_spoiler.sprite_index = spr_start_card_hq_remant_of_humanity;
	//visual_spoiler.visible = true;
	//}
	//else {visual_spoiler.visible = false;}
}
//deck_offset
