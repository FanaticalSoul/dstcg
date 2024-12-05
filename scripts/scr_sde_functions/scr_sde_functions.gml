

function get_sde_deck_size (deck_exists = true) {
	if (deck_exists) return int64(deck_min+(get_bonfire_level()-1)*3);
	return deck_min;
}

function handle_deck_adjustment (_over_card, _over_card_stats, deck_exists = true) {
	// on [ mouse left  click ] // add card to deck
	if (mouse_check_button_pressed(mb_left)) {
		if (deck_exists) {
			// check card type and assossiated limits
			if (_over_card != "remnant of humanity" && !is_market_card(_over_card)) {
				var _card_copy_count = 0;
				//var j = 0;
				for (var j = 0; j < deck_size; j++) {
					if (deck[j] == _over_card) _card_copy_count ++;
				}
				// get max
				var _card_copy_count_max = get_card_copy_count_max(_over_card);
				// add card to deck
				if (_card_copy_count < _card_copy_count_max && deck_size < get_sde_deck_size(deck_exists)) {
					deck[deck_size] = _over_card;
					deck_size++;
				}
			}
			// no limit
			else if (deck_size < get_sde_deck_size(deck_exists)) {
				// add card to deck
				deck[deck_size] = _over_card;
				deck_size++;
			}
		}
		// if deck doesn't exist
		else if (_over_card == "remnant of humanity" || is_stamina(_over_card) ||
		get_card_selection_count(_over_card, false) > 0) {
			if (deck_size < deck_min) {
				// add card to deck
				deck[deck_size] = _over_card;
				deck_size++;
			}
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








//function get_card_copy_count_max (card_name, deck_exists = true) {
function get_card_copy_count_max (card_name) {
	var _count = 0;
	var _inventory = get_data_file(file_deck)[1].inventory[0];
	for (var i = 0; i < array_length(_inventory); i++) {
		if (_inventory[i] == card_name) _count ++;
	}
	return _count;
}


function draw_card_count (card_name, cord_x = x, cord_y = y, selection = true, deck_exists = true) {
	var _backing_offset = -1;
	var _backing_width = 11;
	var _digit_width = 3;
	var _cord_x = cord_x + card_width/2-_backing_width+_backing_offset;
	var _cord_y = cord_y + card_height/2+_backing_offset;
	draw_sprite(spr_digit_backing, -1, _cord_x, _cord_y);
	_cord_x += 2;
	_cord_y -= 2;
	var _count = 0;
	if (selection) _count = get_card_selection_count(card_name, deck_exists);
	else _count = get_card_deck_count(card_name);
	if (_count > 99) _count = 99;
	if (int64(_count/10)>0) draw_sprite(spr_digit, int64(_count/10), _cord_x, _cord_y);
	_cord_x += _digit_width+1;
	draw_sprite(spr_digit, _count%10, _cord_x, _cord_y);
}

// important function
function get_card_selection_count (card_name, deck_exists) {
	if (card_name == "remnant of humanity") return 99;
	else if (is_stamina(card_name) && !deck_exists) return 99;
	else {
		var _count = 4;
		if (deck_exists) _count = get_card_copy_count_max(card_name);
		for (var i = 0; i < array_length(deck); i++) {
			if (deck[i] == card_name) _count--;
		}
		return _count;
	}
}

/*
function get_selection_size (deck_exists) {
	var j = 0;
	for (var i = 0; i < array_length(selection); i++) {
		if (get_card_selection_count(selection[i], deck_exists) == 0) j++;
	}
	return array_length(selection)-j;
}

*/




function get_card_deck_count (card_name) {
	var _card_deck_count = 0;
	for (var i = 0; i < deck_size; i++) {
		if (deck[i] == card_name) _card_deck_count++;
	}
	return _card_deck_count;
}



function draw_sde_card (card_name, deck_exists = true, x_cord = x, y_cord = y, selection = true, x_min = 0, x_max = sprite_width) {
	if (x_min < x_cord && x_cord < x_max) {
		// resolve market cards
		if (is_market_card(card_name)) draw_market_card(card_name, x_cord, y_cord);
		// resolve all other cards
		else {
			var _sprite = spr_start_card_sm_back;
			var _card_stats = card_get_stats(start_card_stats, card_name);
			if (array_length(_card_stats) != 0) {
				_sprite = _card_stats[0].image;
				draw_sprite(_sprite, -1, x_cord, y_cord);
				// show count
				draw_card_count(_card_stats[0].name, x_cord, y_cord, selection, deck_exists);
			}
			else draw_sprite(_sprite, -1, x_cord, y_cord);
		}
	}
}



function set_sde_deck (deck_exists = true) {
	// set actual deck
	deck = [];
	deck_size = 0;
	if (deck_exists) {
		deck = get_deck_from_file();
		deck_size = array_length(deck);
	}
	for (var i = deck_size; i < deck_max; i++) array_push(deck, "");
	array_sort(deck, false);
}


function get_deck_from_file (file = file_deck) {
	if (file_exists(file)) {
		var i;
		var _file_hand = get_data_file(file)[0].hand;
		var _file_deck = get_data_file(file)[0].deck;
		var _file_discard = get_data_file(file)[0].discard;
		var _deck = [];
		for (i = 0; i < array_length(_file_hand); i++) {
			if (_file_hand[i] != "") array_push(_deck, _file_hand[i]);
		}
		for (i = 0; i < array_length(_file_deck); i++) {
			if (_file_deck[i][0] != "") array_push(_deck, _file_deck[i][0]);
		}
		//sout(_file_discard);
		for (i = 0; i < array_length(_file_discard); i++) {
			if (_file_discard[i] != "") array_push(_deck, _file_discard[i]);
		}
		// fill out deck
		var _tmp_int = array_length(_deck);
		for (i = _tmp_int; i < get_sde_deck_size(true); i++) {
			array_push(_deck, "remnant of humanity");
		}
		return _deck;
	}
	else return [];
}



function get_visible_deck () {
	var _visible_deck = [];
	for (var i = 0; i < deck_size; i++) {
		if (deck[i] != "") {
			if (get_card_deck_count(deck[i]) > 0 && !array_contains(_visible_deck, deck[i])) array_push(_visible_deck, deck[i]);
		}
	}
	return _visible_deck;
}

function get_visible_selection (deck_exists = true) {
	var _visible_selection = [];
	//if (selection_filter == "") {
	for (var i = 0; i < selection_size; i++) {
		if (selection[i] != "") {
			if (get_card_selection_count(selection[i], deck_exists) > 0) {
				if (selection_filter == "") array_push(_visible_selection, selection[i]);
				else {
					var _card_stats = card_get_stats(start_card_stats, selection[i]);
					if (is_array(_card_stats)) {
						if (_card_stats[0].type == "equipment") {
							// this is an equipment or weapon
							if (selection_filter == "equipment" || (selection_filter == "weapons" && 
							_card_stats[0].attack != "none")) array_push(_visible_selection, selection[i]);
						}
						// this is stamina
						else if (_card_stats[0].type == "stamina" && selection_filter == "stamina") {
							array_push(_visible_selection, selection[i]);
						}
					}
				}
			}
		}
	}
	sout(_visible_selection);
	return _visible_selection;
}


function is_mouse_over_sde_selection () {
	if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2) {
		if (mouse_x >= x && mouse_x <= sprite_width) return true;
	}
	return false;
}
