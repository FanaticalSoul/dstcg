/// @description Insert description here
// set deck varibles
//visual_spoiler = instance_create_depth(x-208/2,y+sprite_width/2,depth-1,obj_visual_spoiler);
//image_xscale = 2;
deck_size = 0; // cards in deck
deck_offset = 0;
view_spacing = card_height; // space between views
// set selection varibles
var selection_max = 9;
for (var _i = 0; _i < selection_max; _i++) {
	selection[_i] = "";
}
selection_offset = 0;
selection_size = 0;
// add filtered varibles
filtered_selection = undefined;
selection_filter = "";
filtered_selection_size = 0;
// set selection // TF // WoL
var _i = 0;
selection[_i++] = "remant of humanity";
selection[_i++] = "talisman";
selection[_i++] = "kite shield";
selection[_i++] = "spear";
selection[_i++] = "herald armour";
selection[_i++] = "dex stamina";
selection[_i++] = "str stamina";
selection[_i++] = "int stamina";
selection[_i++] = "fth stamina";
selection_size = _i;


selected = false;
card_stats = scr_start_card_stats_set();
selection_size = 9; // humanity, stamina, 4 equipments

for (_i = 0; _i < max_deck; _i++) {
	deck[_i] = "";
}
//y_view = 700;
// have deck act as a psuedo-hand


function scr_handle_deck_edit (_over_card,_over_card_stats) {
	// on [ mouse left  click ] // add card to deck
	if (mouse_check_button_pressed(mb_left)) {
		// check card type and assossiated limits
		if (_over_card_stats[0].type == "equipment" && _over_card != "remant of humanity") {
			var _card_copy_count = 0;
			for (var _j = 0; _j < deck_size; _j ++) {
				if (deck[_j] == _over_card) _card_copy_count ++;
			}
			if (_card_copy_count < 4 && deck_size < deck_min) {
				// add card to deck
				deck[deck_size] = _over_card;
				deck_size++;
			}
		}
		// no limit
		else if (deck_size < deck_min) {
			// add card to deck
			deck[deck_size] = _over_card;
			deck_size++;
		}
	}
	// on [ mouse right click ] // remove card from deck
	else if (mouse_check_button_pressed(mb_right)) {
		// WoL
		var _removed_card_index = -1;
		for (var _j = 0; _j < deck_size; _j ++) {
			if (deck[_j]==_over_card) {
				_removed_card_index = _j;
				break;
			}
		}
		if (_removed_card_index != -1) {
			deck[_removed_card_index] = ""; // don't worry about this because of sorting
			deck_size --;
		}
					
	}
	// sort deck
	array_sort(deck,false);
	//return;
}