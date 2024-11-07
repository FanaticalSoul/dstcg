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
// set ripple particle effect animation delay ( in frames )
#macro ani_delay_ripple 25
// set character placement animation delay ( in frames )
#macro ani_delay_c_place ani_delay_ripple
// set card draw animation delay ( in frames )
#macro ani_delay_card_draw 8
// set placement macros
#macro start_deck_cords [184, 208]
#macro character_cords [start_deck_cords[0], start_deck_cords[0]]
#macro start_discard_cords [start_deck_cords[0],start_deck_cords[1]+card_height+card_spacing]
#macro start_player_cords [16,320]
#macro player_gauges_cords [8,52]
// reveal zone placements
#macro start_deck_reveal_cords [start_player_cords[0]-card_width/2,start_player_cords[1]-card_height-card_spacing*3/4]
#macro start_discard_reveal_cords [start_deck_reveal_cords[0],start_deck_reveal_cords[1]]
// set visability values
#macro deck_visable 5
#macro discard_visable 5
#macro hand_visable 5
// set deck and discard spacing
deck_spacing_width_in_pixels = 4;
discard_spacing_width_in_pixels = deck_spacing_width_in_pixels;
#macro deck_spacing deck_spacing_width_in_pixels / max_deck
#macro discard_spacing discard_spacing_width_in_pixels / max_deck