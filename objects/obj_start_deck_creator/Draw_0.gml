/// @description Insert description here

event_inherited();
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
/*
// unfiltered selection
if (selection_filter == "") {
	for (var i = 0; i < selection_size; i ++) {
		var _sprite = spr_start_card_sm_back;
		var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
		if (0 < _tmp_x && _tmp_x < sprite_width) {
			if (selection[i] != "") {
				var _card_stats = card_get_stats(start_card_stats, selection[i]);
				if (array_length(_card_stats) != 0) _sprite = _card_stats[0].image;
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
				if (array_length(_card_stats) != 0) _sprite = _card_stats[0].image;
			}
			draw_sprite(_sprite, -1, _tmp_x, y);
		}
	}
}

// draw cards at the bottom of screen
for (var i = 0; i < deck_size; i++) {
	var _sprite = spr_start_card_sm_back;
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	if (0 < _tmp_x && _tmp_x < sprite_width) {
		if (deck[i] != "") {
			var _card_stats = card_get_stats(start_card_stats, deck[i]);
			if (array_length(_card_stats) != 0) _sprite = _card_stats[0].image;
		}
		draw_sprite(_sprite,-1,_tmp_x,y+sprite_height+view_spacing);
	}
}
*/
// draw selection cards at the top of screen ( infinite supply of stamina, max of 4 of each equipment )
var _visible_selection = get_visible_selection(false);
var _visible_deck = get_visible_deck();
// selection
for (var i = 0; i < array_length(_visible_selection); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+selection_offset)*(card_spacing+card_width);
	draw_sde_card(_visible_selection[i], false, _tmp_x);
}
// draw cards at the bottom of screen
for (var i = 0; i < array_length(_visible_deck); i++) {
	var _tmp_x = card_spacing+card_width/2+x+(i+deck_offset)*(card_spacing+card_width);
	draw_sde_card(_visible_deck[i], false, _tmp_x, y+sprite_height+view_spacing, false);
}
