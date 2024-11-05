/// @description create macros and globals

// set card demensions
#macro max_deck 40 // max deck size
#macro card_width 32 // card width
#macro card_height 48 // card height
// set visual spoiler demensions
//#macro HQCARDSIZEX 208 // visual spoiler card width
//#macro HQCARDSIZEY 296 // visual spoiler card height
// set card limits
#macro hand_max  6 // maxium cards allowed in a players hand
#macro enemy_max 6 // maxium enemy cards allowed on the enemy board at a time
// set board sizes
#macro board_rows 2 // number of rows on boards
#macro board_cols 3 // number of columns on boards
#macro board_size board_rows*board_cols // number of spaces on boards
// set spacing demensions
#macro card_spacing 8 // number of pixels between cards
// set spacing demensions
#macro deck_min 28 // starting deck size


// intialize temp varibles
var _cord_x, _cord_y, i;
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
		global.board_c_card[i] = {};
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
		global.board_e_card[i] = {}; // enemy card
		i++;
	}
}