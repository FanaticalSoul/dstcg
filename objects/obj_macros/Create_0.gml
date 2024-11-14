/// @description create macros and globals

// new game // TF
//global.new_game = false;
// set card demensions
#macro deck_max 40 // max deck size
#macro card_width 32 // card width
#macro card_height 48 // card height
// set visual spoiler demensions
//#macro HQCARDSIZEX 208 // visual spoiler card width
//#macro HQCARDSIZEY 296 // visual spoiler card height
// set card limits
#macro hand_max 6 // maxium cards allowed in a players hand
// set spacing demensions
#macro card_spacing 8 // number of pixels between cards
#macro deck_min 28 // starting deck size
// set enemy card stats
#macro enemy_card_stats get_enemy_card_stats()
//sout(card_stats_enemy);
// set character card stats
#macro character_card_stats get_character_card_stats()
// set start card stats
#macro start_card_stats get_start_card_stats()
// set start card sprite array ( to help with frame rates )
global.start_card_spr_sm = {};
for (var i = 0; i < array_length(start_card_stats); i++) {
	struct_set(global.start_card_spr_sm, start_card_stats[i][0].name, start_card_stats[i][0].image);
}
// enemy deck set
#macro e_deck_max 20
// set files
#macro file_deck "start_deck.ini"
#macro file_data "save_data.txt"
#macro file_map "save_data_map.txt"


global.room_index = -1;


// test varibles
global.tmp_e_cards = [];