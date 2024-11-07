/// @description encounter setup phases ( 1 )

// initalize varibles
card_placement = 0;
// set random seed
if (i_random_seed == -1) {
	randomize();
	global.random_seed = random_get_seed(); // use for replicating issues
}
else global.random_seed = i_random_seed;
// set global phases
global.phase_c_place  = i_phase_c_place;  // character placement
global.phase_mulligan = i_phase_mulligan; // muligan // sub phase
global.phase_e_place  = i_phase_e_place; // enemy placement
global.phase_e_act    = i_phase_e_act; // enemy activation
global.phase_react    = i_phase_react; // character reaction // sub phase
global.phase_c_act    = i_phase_c_act; // character activation
// set boards
var _cord_x, _cord_y, i; // intialize temp varibles
// set character board cords
_cord_x = card_width *0.5+card_spacing*1;
_cord_y = card_height*1.5+card_spacing*2;
i = 0;
for (var iy = 0; iy < board_rows; iy++) {
	for (var ix = 0; ix < board_cols; ix++) {
		global.board_c_cords[i] = [
			_cord_x+ix*(card_width +card_spacing),
			_cord_y+iy*(card_height+card_spacing)
		]
		i++;
	}
}
// set character board cards
i = 0;
for (var iy = 0; iy < board_rows; iy++) {
	for (var ix = 0; ix < board_cols; ix++) {
		if (is_undefined(i_board_c_card[i])) global.board_c_card[i] = noone;
		else global.board_c_card[i] = i_board_c_card[i];
		i++;
	}
}
// set enemy board cords
_cord_x = card_width *0.5+card_spacing*1;
_cord_y = card_height*3.5+card_spacing*5;
i = 0;
for (var iy = 0; iy < board_rows; iy++) {
	for (var ix = 0; ix < board_cols; ix++) {
		global.board_e_cords[i] = [ // enemy cords
			_cord_x+ix*(card_width +card_spacing),
			_cord_y+iy*(card_height+card_spacing)
		];
		i++;
	}
}
// set enemy board cards
i = 0;
for (var iy = 0; iy < board_rows; iy++) {
	for (var ix = 0; ix < board_cols; ix++) {
		// set non-existant enemy on board
		if (is_undefined(i_board_e_card[i])) global.board_e_card[i] = noone;
		else global.board_e_card[i] = i_board_e_card[i];
		i++;
	}
}
// log phase start
if (i_phase_c_place) sout("phase 1 - character placement");