/// @description Insert description here

event_inherited();
var _tmp_x, _tmp_y;
// get values
var _deck_size = obj_start_deck_editor.deck_size;
var _deck_max = obj_start_deck_editor.get_deck_size();
// show card count
_tmp_x = x-spr_x;
_tmp_y = y-spr_y+2+digit_y;
draw_digits(_deck_size, digits, _tmp_x, _tmp_y, offset_x);
// show max deck size
_tmp_x = _tmp_x+(digit_x+1)*3;
draw_digits(_deck_max, digits, _tmp_x, _tmp_y, offset_x);