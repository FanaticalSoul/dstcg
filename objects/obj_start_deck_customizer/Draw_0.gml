/// @description Insert description here

// draw boards
draw_self();
var _tmp_y = y+sprite_height+view_spacing;
draw_sprite(sprite_index,-1,x,_tmp_y);
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )


// additional filter ( added for customizer )


// end filter

var _visible_selection = get_visible_selection();
// selection
for (var i = 0; i < array_length(_visible_selection); i++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		var _card_stats = card_get_stats(start_card_stats, _visible_selection[i]);
		if (_card_stats != {}) {
			_sprite = _card_stats[0].image;
			draw_sprite(_sprite, -1, _tmp_x, y);
			// show count
			draw_card_count(_card_stats[0].name, _tmp_x);
		}
		else draw_sprite(_sprite,-1,_tmp_x,y);
	}
}
// draw cards at the bottom of screen
for (var i = 0; i < deck_size; i++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		var _card_stats = undefined;
		if (deck[i] != "") {
			_card_stats = card_get_stats(start_card_stats, deck[i]);
			if (_card_stats != {}) _sprite = _card_stats[0].image;
		}
		draw_sprite(_sprite,-1,_tmp_x,_tmp_y);
		// draw count
		if (!is_undefined(_card_stats)) {
			if (_card_stats != {}) draw_card_count(_card_stats[0].name, _tmp_x, _tmp_y, false);
		}
	}
}
// output amount of cards in deck
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_text (x+sprite_width/2,y+sprite_height/2+view_spacing/2,string(deck_size));
