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
// show number of souls
var _souls = int64(get_data_file(file_deck)[1].inventory[1]);
_tmp_y = y-_spr_y+2;
_tmp_y += _digit_y; // center digit
_tmp_x -= _spr_x
draw_digits(_souls, _digits, _tmp_x, _tmp_y, _offset_x);
// show cost
var _cost = obj_start_deck_editor.get_market_dept();
_tmp_x += (_offset_x+2)*(_digits+1);
draw_digits(_cost, _digits, _tmp_x, _tmp_y, _offset_x);
// show total cost
var _dept = _souls-_cost;
_tmp_y = y+_spr_y-1;
_tmp_x = x-_digit_x*2;
if (_dept < 0) {
	draw_sprite(spr_digit_negative, -1, _tmp_x+1, _tmp_y);
}
_tmp_x += _digit_x;
draw_digits(abs(_dept), _digits, _tmp_x, _tmp_y, _offset_x);