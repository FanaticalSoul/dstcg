/// @description Insert description here
// You can write your code in this editor



function draw_digits (number, digits = 2, x_cord = x, y_cord = y, offset_x = 0) {
	var _number = number;
	if (number > power(10, digits)-1) _number = power(10, digits)-1;
	var _num_arr = [];
	for (var i = digits; i > 0; i--) {
		var _tmp_num = int64((_number%power(10,i))/power(10,i-1));
		array_push(_num_arr, _tmp_num);
	}
	// draw numbers
	for (var i = 0; i < array_length(_num_arr); i++) {
		// prevents zeros from being drawn everywhere
		var _tmp_x = x_cord+2*(i+1)+offset_x*i;
		var _tmp_num = abs(i-(array_length(_num_arr)-1));
		if (_number >= power(10,_tmp_num) || i+1 == array_length(_num_arr)) {
			draw_sprite(spr_digit, _num_arr[i], _tmp_x, y_cord);
		}
	}
}



