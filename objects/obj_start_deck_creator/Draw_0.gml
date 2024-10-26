/// @description Insert description here
// draw boards
//draw_sprite(spr_reveal_board,-1,x,y);
draw_self();
var _tmp_y = y+sprite_height+view_spacing;
draw_sprite(spr_reveal_board,-1,x,_tmp_y);
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
for (var _i = 0; _i < selection_size; _i ++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(_i+selection_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		if (selection[_i] != "") {
			var _card_stats = scr_get_stats(selection[_i], card_stats);
			if (_card_stats != undefined) _sprite = _card_stats[0].image;
		}
		draw_sprite(_sprite,-1,_tmp_x,y);
	}
}

// draw cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
for (var _i = 0; _i < deck_size; _i ++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(_i+deck_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		if (deck[_i] != "") {
			var _card_stats = scr_get_stats(deck[_i], card_stats);
			if (_card_stats != undefined) _sprite = _card_stats[0].image;
		}
		//draw_sprite(_sprite,-1,_tmp_x,_tmp_y);
		draw_sprite(_sprite,-1,_tmp_x,_tmp_y);
	}
}