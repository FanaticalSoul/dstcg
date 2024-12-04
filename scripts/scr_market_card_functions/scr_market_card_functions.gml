
function is_market_card (card_name) {
	var _flag = false;
	var _str_split = string_split(card_name, " ", true);
	if (array_length(_str_split)>0) {
		if (_str_split[0]=="market") _flag = true;
	}
	return _flag;
}

function get_market_card_name (card_name) {
	var _card_name = "";
	var _str_split = string_split(card_name, " ", true);
	for (var i = 1; i < array_length(_str_split); i++) {
		_card_name += _str_split[i];
		if (i+1 < array_length(_str_split)) _card_name += " ";
	}
	return _card_name;
}

function get_market_card_cost (card_name) {
	var _cost = 0;
	with (market) {
		for (var i = 0; i < array_length(card_selection); i++) {
			if (card_name == "market "+card_selection[i][0]) {
				_cost = card_selection[i][1];
				break;
			}
		}
	}
	return _cost;
}


function draw_market_card (card_name, x_cord = x, y_cord = y) {
	var _card_name = get_market_card_name(card_name);
	var _sprite = spr_start_card_sm_back;
	var _card_stats = card_get_stats(start_card_stats, _card_name);
	if (array_length(_card_stats) != 0) {
		_sprite = _card_stats[0].image;
		draw_sprite(_sprite, -1, x_cord, y_cord);
		// show count
		draw_card_count(card_name, x_cord, y_cord, false);
		draw_market_dept(card_name, x_cord, y_cord);
	}
	else draw_sprite(_sprite, -1, x_cord, y_cord);
}


function draw_market_dept (card_name = "false", cord_x = x, cord_y = y) {
	var _backing_offset_x = (card_name == "false") ? 0 : -1;
	var _backing_offset_y = (card_name == "false") ? 0 :  1;
	var _backing_width = 11;
	var _backing_height = 9;
	var _digit_width = 3;
	var _cord_x = cord_x;
	var _cord_y = cord_y;
	if (card_name == "false") {
		_cord_x = cord_x+_backing_width/2;
		_cord_y = cord_y-_backing_height/2;
	}
	else {
		_cord_x = cord_x+card_width /2-_backing_width +_backing_offset_x;
		_cord_y = cord_y-card_height/2+_backing_height+_backing_offset_y;
	}
	draw_sprite(spr_digit_backing, -1, _cord_x, _cord_y);
	_cord_x += 2;
	_cord_y -= 2;
	var _count = 0;
	if (card_name == "false") _count = get_market_dept();
	else {
		// cost per copy
		_count = get_card_deck_count(card_name);
		_count *= get_market_card_cost(card_name)
	}
	if (_count > 99) _count = 99;
	if (int64(_count/10)>0) draw_sprite(spr_digit, int64(_count/10), _cord_x, _cord_y);
	_cord_x += _digit_width+1;
	draw_sprite(spr_digit, _count%10, _cord_x, _cord_y);
}


function get_market_dept (deck_editor = obj_start_deck_editor) {
	with (deck_editor) {
		var _dept = 0;
		for (var i = 0; i < deck_size; i++) {
			if (is_market_card(deck[i])) {
				_dept += get_market_card_cost(deck[i]);
			}
		}
		// resolve bonfire triggers
		if (get_bonfire_level()==3) _dept -= 2;
		else if (get_bonfire_level()==4) _dept -= 5;
		// return dept
		return int64(_dept);
	}
}