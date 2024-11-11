/// @description WoL

draw_self();
// draw cards from selection
for (var i = 0; i < min(cards_visable, array_length(card_selection)); i++) {
	var _y = y+card_height/2+card_spacing;
	var _card_name = card_selection[i+abs(selection_offset)];
	var _card_stats = card_get_stats(character_card_stats, _card_name);
	draw_sprite(_card_stats.image_sm_front, -1, x, _y+(card_height+card_spacing)*i);
	if (selected == _card_name) draw_sprite(spr_card_sm_selected, -1, x, _y+(card_height+card_spacing)*i);
}
//sout(selection_offset);