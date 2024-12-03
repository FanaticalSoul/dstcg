/// @description Insert description here

draw_self();
var _tmp_x = x;
var _tmp_y = y;
var _spr_x = int64(sprite_width/2);
var _digits = 2;
/*
if (_spr_x%1>0) _spr_x = int64(_spr_x)+1;
else _spr_x = int64(_spr_x);
*/
var _spr_y = int64(sprite_height/2);
/*
if (_spr_y%1>0) _spr_y = int64(_spr_y)+1;
else _spr_y = int64(_spr_y);
*/


var _digit_y = 5;
var _digit_x = 3;
var _offset_x = int64(_digit_x/2);
if (_digit_x/2 > _offset_x) _offset_x += 1;
var _number = 0;
var _num_arr = [];
// show number of souls
_number = int64(get_data_file(file_deck)[1].inventory[1]);
_tmp_y = y-_spr_y+2;
_tmp_y += _digit_y; // center digit
_tmp_x -= _spr_x
draw_digits(_number, _digits, _tmp_x, _tmp_y, _offset_x);
// show cost
_number = obj_start_deck_editor.get_market_dept();
_tmp_x += (_offset_x+2)*(_digits+1);
draw_digits(_number, _digits, _tmp_x, _tmp_y, _offset_x);
/*
if (instance_exists(obj_start_deck_editor)) {
	_x_cord += (_offset_x+2)*(array_length(_num_arr)+1);
	_num_arr = [];
	_number = obj_start_deck_editor.get_market_dept();
	if (_number > 99) _number = 99;
	_num_arr = [int64(_number/10), int64(_number%10)];
	for (var i = 0; i < array_length(_num_arr); i++) {
		_tmp_x = _x_cord+2*(i+1)+_offset_x*i;
		// prevents zeros from being drawn everywhere
		var _tmp_num = abs(i-(array_length(_num_arr)-1));
		if (_number >= power(10,_tmp_num) || i == array_length(_num_arr)) {
			draw_sprite(spr_digit, _num_arr[i], _tmp_x, _tmp_y);
		}
	}
}
*/


