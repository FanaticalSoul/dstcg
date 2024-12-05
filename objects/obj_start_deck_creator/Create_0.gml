/// @description Insert description here

// use parent
event_inherited();
// set selection
var i = 0;
selection[i++] = "remnant of humanity";
selection[i++] = "talisman";
selection[i++] = "kite shield";
selection[i++] = "spear";
selection[i++] = "herald armour";
selection[i++] = "knight armour";
selection[i++] = "long sword";
selection[i++] = "short sword";
selection[i++] = "knight shield";
selection[i++] = "dex stamina";
selection[i++] = "str stamina";
selection[i++] = "int stamina";
selection[i++] = "fth stamina";
selection_size = i;
// set deck
set_sde_deck(false);
/*
function scr_handle_deck_edit (_over_card,_over_card_stats) {
	// on [ mouse left  click ] // add card to deck
	if (mouse_check_button_pressed(mb_left)) {
		// check card type and assossiated limits
		if (_over_card_stats[0].type == "equipment" && _over_card != "remnant of humanity") {
			var _card_copy_count = 0;
			for (var j = 0; j < deck_size; j++) {
				if (deck[j] == _over_card) _card_copy_count ++;
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
		var _removed_card_index = -1;
		for (var j = 0; j < deck_size; j ++) {
			if (deck[j]==_over_card) {
				_removed_card_index = j;
				break;
			}
		}
		if (_removed_card_index != -1) {
			deck[_removed_card_index] = ""; // don't worry about this because of sorting
			deck_size--;
			deck_offset = min(0,deck_offset+1); // decrement offset
		}		
	}
	// sort deck
	array_sort(deck,false);
}
*/

/// @function					is_mouse_over_display_card(card_num, [offset_x], [offset_y]);
/// @param {real} card_num		displayed card number
/// @param {real} offset_x		how much the display x cord is offset by
/// @param {real} offset_y		how much the display y cord is offset by
/// @description				check if the mouse is over this display card
/// @return						{bool}

function is_mouse_over_display_card (card_num, offset_x = 0, offset_y = 0) {
	if (mouse_x > card_spacing+card_num*(card_width+card_spacing)+offset_x && 
	mouse_x <= card_width+card_spacing+card_num*(card_width+card_spacing)+offset_x && 
	mouse_y > card_spacing+offset_y && mouse_y <= card_height+card_spacing+offset_y) return true;
	else return false;
}

/// @function					is_mouse_over_display_deck([display_deck_id]);
/// @param {id} display_deck_id	display deck id
/// @description				check if mouse is over the deck that is being built
/// @return						{bool}

function is_mouse_over_display_deck (display_deck_id = id) {
	with (display_deck_id) {
		if (mouse_y <= (y+sprite_height+view_spacing)+card_height/2 && 
		mouse_y >= (y+sprite_height+view_spacing)-card_height/2 && 
		mouse_x >= x && mouse_x <= sprite_width) return true;
		else return false;
	}
}