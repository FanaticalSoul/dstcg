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
// output amount of cards in deck











/*
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
var _tmp_x = x+sprite_width/2;
_tmp_y = y+sprite_height/2+view_spacing/2;
draw_text (_tmp_x,_tmp_y,string(deck_size));
draw_market_dept("false", _tmp_x-card_width/2, _tmp_y);
//draw_text (_tmp_x-card_width/2,_tmp_y,string(get_market_dept()));
var _souls = int64(get_data_file(file_deck)[1].inventory[1]);
draw_text (_tmp_x+card_width/2,_tmp_y,string(_souls));
*/
var _tmp_x = x+sprite_width/2;
_tmp_y = y+sprite_height/2+view_spacing/2;
//draw_text (_tmp_x,_tmp_y,string(deck_size));
//draw_sprite(spr_sde_display_backing, -1, _tmp_x, _tmp_y);





