/// @description Insert description here

event_inherited();
var _tmp_x, _tmp_y;
// get values
var _souls = int64(get_data_file(file_deck)[1].inventory[1]);
var _cost = obj_start_deck_editor.get_market_dept();
var _dept = _souls-_cost;
// show number of souls
_tmp_x = x-spr_x+1;
_tmp_y = y-spr_y+digit_y+3;
draw_digits(_souls, digits, _tmp_x, _tmp_y, offset_x);
// show cost
_tmp_x = x-spr_x+(offset_x+2)*(digits+1)-1;
draw_digits(_cost, digits, _tmp_x, _tmp_y, offset_x);
// show total cost
_tmp_x = x-digit_x*2+1;
_tmp_y = y+digit_y+2;
if (_dept < 0) draw_sprite(spr_digit_negative, -1, _tmp_x, _tmp_y);
_tmp_x = _tmp_x+digit_x-1;
draw_digits(abs(_dept), digits, _tmp_x, _tmp_y, offset_x);