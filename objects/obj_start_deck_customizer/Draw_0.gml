/// @description Insert description here

// draw boards
draw_self();
var _tmp_y = y+sprite_height+view_spacing;
draw_sprite(sprite_index,-1,x,_tmp_y);
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )


// unfiltered selection
if (selection_filter == "") {
	for (var i = 0; i < selection_size; i ++) {
		var _sprite = spr_start_card_sm_back;
		var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
		if (0 < _tmp_x && _tmp_x < sprite_width) {
			if (selection[i] != "") {
				var _card_stats = card_get_stats(start_card_stats, selection[i]);
				if (_card_stats != {}) _sprite = _card_stats[0].image;
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
	for (var i = 0; i < selection_size; i++) filtered_selection[i] = "";
	// set filtered selection
	for (var i = 0; i < selection_size; i++) {
		if (selection[i] != "") {
			var _card_stats = card_get_stats(start_card_stats, selection[i]);
			//sout(card_get_stats(start_card_stats, selection[i]));
			if (is_array(_card_stats)) {
				if ( _card_stats[0].type == "equipment") {
					if (selection_filter == "equipment") {
						// this is an equipment
						filtered_selection[filtered_selection_size] = selection[i];
						filtered_selection_size ++;
					}
					else if (selection_filter == "weapons" && _card_stats[0].attack != "none") {
						// this is a weapon
						filtered_selection[filtered_selection_size] = selection[i];
						filtered_selection_size ++;
					}
				}
				else if (_card_stats[0].type == "stamina" && selection_filter == "stamina") {
					// this is stamina
					filtered_selection[filtered_selection_size] = selection[i];
					filtered_selection_size ++;
				}
			}
		}
	}
	// draw filtered selection
	for (var i = 0; i < filtered_selection_size; i++) {
		var _sprite = spr_start_card_sm_back;
		var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
		if (0 < _tmp_x && _tmp_x < sprite_width) {
			if (filtered_selection[i] != "") {
				var _card_stats = card_get_stats(start_card_stats, filtered_selection[i]);
				if (_card_stats != {}) _sprite = _card_stats[0].image;
			}
			draw_sprite(_sprite,-1,_tmp_x,y);
			//draw_sprite(spr_card_sm_selected,-1,_tmp_x,y);
		}
	}
}




// draw cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
for (var i = 0; i < deck_size; i++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		if (deck[i] != "") {
			var _card_stats = card_get_stats(start_card_stats, deck[i]);
			if (_card_stats != {}) _sprite = _card_stats[0].image;
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
