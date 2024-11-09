/// @description draw object

if (instance_exists(player)) { // TF // only draw if player exists
	for (var i = 0; i < deck_size; i++) {
		if (deck[i][0]!="") { // existing cards
			if (deck_reveal) {
				depth = -board_size-2; // fixes bug with displaying over enemy cards
				draw_sprite(spr_reveal_board,-1,player.x-card_width/2,start_deck_reveal_cords[1]); // draw background
				var _above_hand_x = player.x+card_spacing+deck_reveal_offset*(card_width+card_spacing); // offset cards
				// tmp cordinate values
				var _tmp_x = _above_hand_x+i*(card_width+card_spacing);
				// check bounds
				if (_tmp_x >= 0 && _tmp_x <= room_width) {
					// reverse card order to get an accurate view of upcoming cards
					var _reverse_card = deck[deck_size-1-i];
					// only draw inside the room
					if (_reverse_card[1] || deck_reveal_full) {
						draw_sprite(struct_get(global.start_card_spr_sm, _reverse_card[0]),-1,_tmp_x,start_deck_reveal_cords[1]);
					}
					else draw_sprite(spr_start_card_sm_back,-1,_tmp_x,start_deck_reveal_cords[1]);
					// hide missing cards
					if (deck_size < deck_visable) {
						for (var j = 0; j < deck_visable-deck_size; j++) {
							draw_sprite(spr_texture_black,-1,_tmp_x+(j+1)*(card_spacing+card_width),start_deck_reveal_cords[1]);
						}
					}
				}
				//depth = tmp_depth;
			}
			else {
				depth = tmp_depth;
				// show card in deck if revealed
				if (deck[i][1] || deck_reveal_full) {
					draw_sprite(struct_get(global.start_card_spr_sm, deck[i][0]),-1,x+i*deck_spacing,y-i*deck_spacing);
				}
				// show card back if not revealed
				else draw_sprite(spr_start_card_sm_back,-1,x+i*deck_spacing,y-i*deck_spacing);
			}
		}
	}
}