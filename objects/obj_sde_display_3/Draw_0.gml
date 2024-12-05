/// @description Insert description here

event_inherited();
var _tmp_x, _tmp_y;
// get values
var _deck_size = deck_editor.deck_size;
// show card count
_tmp_x = x-spr_x;
_tmp_y = y-spr_y+digit_y+1;
draw_digits(_deck_size, digits, _tmp_x, _tmp_y, offset_x);
// show max deck size
_tmp_x = _tmp_x+(digit_x+1)*3+1;
_tmp_y = _tmp_y+1;
draw_digits(deck_min, digits, _tmp_x, _tmp_y, offset_x);