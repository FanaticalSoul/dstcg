/// @description Insert description here

// draw boards
draw_self();
var _tmp_y = y+sprite_height+view_spacing;
draw_sprite(sprite_index, -1, x, _tmp_y);
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
var _visible_selection = get_visible_selection();
var _visible_deck = get_visible_deck();
// selection
for (var i = 0; i < array_length(_visible_selection); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
	draw_customizer_card(_visible_selection[i], _tmp_x);
}
// draw cards at the bottom of screen
for (var i = 0; i < array_length(_visible_deck); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	draw_customizer_card(_visible_deck[i], _tmp_x, _tmp_y, false);
}