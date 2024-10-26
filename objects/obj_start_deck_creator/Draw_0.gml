/// @description Insert description here
// draw boards
//draw_sprite(spr_reveal_board,-1,x,y);
draw_self();
var _tmp_y = y+sprite_height+view_spacing;
draw_sprite(sprite_index,-1,x,_tmp_y);
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )


// unfiltered selection
if (selection_filter == "") {
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
}
// filter selection
else {
	// define filtered selection
	filtered_selection = undefined;
	filtered_selection_size = 0;
	for (var _i = 0; _i < selection_size; _i++) filtered_selection[_i] = "";
	// set filtered selection
	for (var _i = 0; _i < selection_size; _i ++) {
		if (selection[_i] != "") {
			var _card_stats = scr_get_stats(selection[_i], card_stats);
			if (_card_stats != undefined) {
				if ( _card_stats[0].type == "equipment") {
					if (selection_filter == "equipment") {
						// this is an equipment
						filtered_selection[filtered_selection_size] = selection[_i];
						filtered_selection_size ++;
					}
					else if (selection_filter == "weapons" && _card_stats[0].attack != "none") {
						// this is a weapon
						filtered_selection[filtered_selection_size] = selection[_i];
						filtered_selection_size ++;
					}
				}
				else if (_card_stats[0].type == "stamina" && selection_filter == "stamina") {
					// this is stamina
					filtered_selection[filtered_selection_size] = selection[_i];
					filtered_selection_size ++;
				}
			}
		}
	}
	// draw filtered selection
	for (var _i = 0; _i < filtered_selection_size; _i ++) {
		var _sprite = spr_start_card_sm_back;
		var _tmp_x = card_spacing+card_width/2+x+(_i+selection_offset)*(card_spacing+card_width);
		if (0 < _tmp_x && _tmp_x < sprite_width) {
			if (filtered_selection[_i] != "") {
				var _card_stats = scr_get_stats(filtered_selection[_i], card_stats);
				if (_card_stats != undefined) _sprite = _card_stats[0].image;
			}
			draw_sprite(_sprite,-1,_tmp_x,y);
		}
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
// output amount of cards in deck
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_text (x+sprite_width/2,y+sprite_height/2+view_spacing/2,string(deck_size));