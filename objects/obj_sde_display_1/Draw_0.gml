/// @description Insert description here

draw_self();
var _tmp_x = x;
var _tmp_y = y;
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
//
_tmp_x = x-_spr_x+2;
_tmp_y = y-_spr_y+2;
_tmp_y += _digit_y; // center digit
draw_sprite(spr_digit, 9, _tmp_x, _tmp_y);