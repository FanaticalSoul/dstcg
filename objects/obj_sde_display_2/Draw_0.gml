/// @description Insert description here
// You can write your code in this editor

draw_self();
var _tmp_x = x;
var _tmp_y = y;
var _digits = 2;
var _spr_x = int64(sprite_width/2);
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
// show card count
var _deck_size = obj_start_deck_editor.deck_size;
_tmp_y = y-_spr_y+2;
_tmp_y += _digit_y; // center digit
_tmp_x -= _spr_x;
draw_digits(_deck_size, _digits, _tmp_x, _tmp_y, _offset_x);
// show max deck size
var _deck_max = obj_start_deck_editor.get_deck_size();
_tmp_x += (_digit_x+1)*3;
//_tmp_x += (_offset_x+2)*(_digits+1);
draw_digits(_deck_max, _digits, _tmp_x, _tmp_y, _offset_x);