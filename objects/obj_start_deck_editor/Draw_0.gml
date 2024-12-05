/// @description Insert description here

event_inherited();
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
var _visible_selection = get_visible_selection();
var _visible_deck = get_visible_deck();
// selection
for (var i = 0; i < array_length(_visible_selection); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
	draw_sde_card(_visible_selection[i], true, _tmp_x);
}
// draw cards at the bottom of screen
for (var i = 0; i < array_length(_visible_deck); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	draw_sde_card(_visible_deck[i], true, _tmp_x, y+sprite_height+view_spacing, false);
}
