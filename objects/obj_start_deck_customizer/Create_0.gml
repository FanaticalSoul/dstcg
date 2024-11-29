/// @description Insert description here


function set_deck () {
	var i;
	var _file_hand = get_data_file(file_deck)[0].hand;
	var _file_deck = get_data_file(file_deck)[0].deck;
	var _file_discard = get_data_file(file_deck)[0].discard;
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
	for (i = _tmp_int; i < get_deck_size(); i++) {
		array_push(_deck, "remant of humanity");
	}
	// set actual deck
	deck_size = 0;
	deck = _deck;
	deck_size = array_length(_deck);
	for (i = deck_size; i < deck_max; i++) {
		array_push(_deck, "");
	}
	array_sort(deck,false);
	deck_offset = 0;
}



function get_deck_size () {
	var _bonfire_level = get_data_file(file_deck)[2];
	return int64(deck_min+(_bonfire_level-1)*3);
}

// set deck varibles
//visual_spoiler = instance_create_depth(x-208/2,y+sprite_width/2,depth-1,obj_visual_spoiler);
view_spacing = card_height; // space between views

visual_spoiler = instance_create_depth(0,0,depth-1,obj_start_deck_creator_spoiler, {deck_creator : id});
//image_xscale = 2;
deck_size = 0; // cards in deck
deck_offset = 0;
// set selection varibles
var selection_max = 0;
selection_max += 16; // Class Cards
selection_max +=  1; // Remnant of Humanity Cards
selection_max += 40; // Common Treasure Cards
selection_max += 10; // Transposed Treasure Cards
selection_max +=  4; // Stamina Cards
selection_max +=  8; // Market Cards
for (var i = 0; i < selection_max; i++) selection[i] = "";
// initalize varibles
selection_offset = 0;
selection_size = 0;
// add filtered varibles
filtered_selection = undefined;
selection_filter = "";
filtered_selection_size = 0;
// set selection // TF // WoL
var i = 0;
var j = 0;

var _selection = get_data_file(file_deck)[1].inventory[0];
selection[j++] = "remant of humanity";
for (i = 0; i < array_length(_selection); i++) {
	if (!array_contains(selection, _selection[i])) {
		selection[j++] = _selection[i];
	}
}
selection_size = j;
visible_selection = selection;
//selected = false;
//card_stats = start_card_stats;
//selection_size = 9; // humanity, stamina, 4 equipments


// get the bonfire level // CiD




//for (i = 0; i < deck_max; i++) deck[i] = "";

//y_view = 700;
// have deck act as a psuedo-hand






// new features



set_deck();
// set actual deck


function handle_deck_adjustment (_over_card, _over_card_stats) {
	// on [ mouse left  click ] // add card to deck
	if (mouse_check_button_pressed(mb_left)) {
		// check card type and assossiated limits
		//if (_over_card_stats[0].type == "equipment" && _over_card != "remant of humanity") {
		if (_over_card != "remant of humanity") {
			var _card_copy_count = 0;
			//var j = 0;
			for (var j = 0; j < deck_size; j++) {
				if (deck[j] == _over_card) _card_copy_count ++;
			}
			// get max
			var _card_copy_count_max = get_card_copy_count_max(_over_card);
			// add card to deck
			if (_card_copy_count < _card_copy_count_max && deck_size < get_deck_size()) {
				deck[deck_size] = _over_card;
				deck_size++;
			}
		}
		// no limit
		else if (deck_size < get_deck_size()) {
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








function get_card_copy_count_max (card_name) {
	var _count = 0;
	var _inventory = get_data_file(file_deck)[1].inventory[0];
	for (var i = 0; i < array_length(_inventory); i++) {
		if (_inventory[i] == card_name) _count ++;
	}
	return _count;
}


function draw_card_count (card_name, cord_x = x, cord_y = y, selection = true) {
	var _backing_offset = -1;
	var _backing_width = 11;
	var _digit_width = 3;
	var _cord_x = cord_x + card_width/2-_backing_width+_backing_offset;
	var _cord_y = cord_y + card_height/2+_backing_offset;
	draw_sprite(spr_digit_backing, -1, _cord_x, _cord_y);
	_cord_x += 2;
	_cord_y -= 2;
	var _count = 0;
	if (selection) _count = get_card_selection_count(card_name);
	else _count = get_card_deck_count(card_name);
	if (int64(_count/10)>0) draw_sprite(spr_digit, int64(_count/10), _cord_x, _cord_y);
	_cord_x += _digit_width+1;
	draw_sprite(spr_digit, _count%10, _cord_x, _cord_y);
}


function get_card_selection_count (card_name) {
	if (card_name == "remant of humanity") return 99;
	else {
		var _count = get_card_copy_count_max(card_name);
		for (var i = 0; i < array_length(deck); i++) {
			if (deck[i] == card_name) _count--;
		}
		return _count;
	}
}

function get_selection_size () {
	var j = 0;
	for (var i = 0; i < array_length(selection); i++) {
		if (get_card_selection_count(selection[i]) == 0) j++;
	}
	return array_length(selection)-j;
}



function get_visible_selection () {
	var _visible_selection = [];
	//if (selection_filter == "") {
	for (var i = 0; i < selection_size; i++) {
		if (selection[i] != "") {
			if (get_card_selection_count(selection[i]) > 0) {
				if (selection_filter == "") array_push(_visible_selection, selection[i]);
				else {
					var _card_stats = card_get_stats(start_card_stats, selection[i]);
					//sout(card_get_stats(start_card_stats, selection[i]));
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
	return _visible_selection;
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
function get_card_deck_count (card_name) {
	var _card_deck_count = 0;
	for (var i = 0; i < deck_size; i++) {
		if (deck[i] == card_name) _card_deck_count++;
	}
	return _card_deck_count;
}



function draw_customizer_card (card_name, x_cord = x, y_cord = y, selection = true, x_cord_min = 0, x_cord_max = sprite_width) {
	if (x_cord_min < x_cord && x_cord < x_cord_max) {
		var _sprite = spr_start_card_sm_back;
		var _card_stats = card_get_stats(start_card_stats, card_name);
		if (_card_stats != {}) {
			_sprite = _card_stats[0].image;
			draw_sprite(_sprite, -1, x_cord, y_cord);
			// show count
			draw_card_count(_card_stats[0].name, x_cord, y_cord, selection);
		}
		else draw_sprite(_sprite, -1, x_cord, y_cord);
	}
}