/// @description WoL

draw_self();
// draw cards from selection
for (var i = 0; i < min(cards_visable, array_length(card_selection)); i++) {
	var _y = y+card_height/2+card_spacing;
	var _card_name = card_selection[i+abs(selection_offset)][0];
	var _card_stats = card_get_stats(start_card_stats, _card_name);
	var _tmp_y = _y+(card_height+card_spacing)*i;
	draw_sprite(_card_stats[0].image, -1, x, _tmp_y);
	// show stamina highlighted if bonfire trigger hasn't been resolved
	if (get_bonfire_level()==3) {
		// highlight cards
		if (!deck_contains_x_soul_stamina(2, deck_editor)) {
			if (is_x_soul_stamina(_card_name, 2)) draw_sprite(spr_card_sm_selected_alt_2,-1,x,_tmp_y);
		}
	}
	else if (get_bonfire_level()==4) {
		// highlight cards
		if (!deck_contains_x_soul_stamina(5, deck_editor)) {
			if (is_x_soul_stamina(_card_name, 5)) draw_sprite(spr_card_sm_selected_alt_2,-1,x,_tmp_y);
		}
	}
}