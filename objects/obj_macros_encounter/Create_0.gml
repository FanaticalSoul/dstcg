/// @description set encounter macros

// set visability values
#macro deck_visable 5
#macro discard_visable 5
#macro hand_visable 5
// set board sizes
#macro board_rows 2 // number of rows on boards
#macro board_cols 3 // number of columns on boards
#macro board_size board_rows*board_cols // number of spaces on boards
#macro enemy_max board_size // maxium enemy cards allowed on the enemy board at a time
// set ripple particle effect animation delay ( in frames )
#macro ani_delay_ripple 25
// set character placement animation delay ( in frames )
#macro ani_delay_c_place ani_delay_ripple
// set card draw animation delay ( in frames )
#macro ani_delay_card_draw 8
// set deck and discard spacing
#macro deck_spacing (4 / max_deck) // 4 pixels
#macro discard_spacing deck_spacing
#macro e_deck_spacing (6 / e_deck_max)
// set placement macros
#macro start_deck_cords [184, 208]
#macro character_cords [start_deck_cords[0]+deck_min*deck_spacing, start_deck_cords[0]+deck_min*deck_spacing]
#macro start_discard_cords [start_deck_cords[0],start_deck_cords[1]+card_height+card_spacing]
#macro start_player_cords [16,320]
#macro player_gauges_cords [8,52]
#macro e_deck_cords [144,264]
// reveal zone placements
#macro start_deck_reveal_cords [start_player_cords[0]-card_width/2,start_player_cords[1]-card_height-card_spacing*3/4]
#macro start_discard_reveal_cords [start_deck_reveal_cords[0],start_deck_reveal_cords[1]]