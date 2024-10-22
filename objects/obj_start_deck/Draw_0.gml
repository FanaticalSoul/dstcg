/// @description draw object
for (var _i = 0; _i < deck_size; _i++) {
	if (deck[_i][0]!="") { // existing cards
		if (deck_reveal) {
			draw_sprite(spr_reveal_board,-1,player.x-card_width/2,deck_reveal_y); // draw background
			var _above_hand_x = player.x+CARDSPACING+deck_reveal_offset*(card_width+CARDSPACING); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+_i*(card_width+CARDSPACING);
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = deck[deck_size-1-_i];
				// only draw inside the room
				if (_reverse_card[1] || deck_reveal_full) {
					var _sprite = spr_start_card_sm_front;
					for (var _j = 0; _j < array_length(start_card_stats); _j++) {
						if (struct_get(start_card_stats[_j][0],"name") == _reverse_card[0]) {
							_sprite = struct_get(start_card_stats[_j][0],"image");
							break;
						}
					}
					draw_sprite(_sprite,-1,_tmp_x,deck_reveal_y);
				}
				else draw_sprite(spr_start_card_sm_back,-1,_tmp_x,deck_reveal_y);
				// hide missing cards
				if (deck_size < deck_visable) {
					for (var _j = 0; _j < deck_visable-deck_size; _j++) {
						draw_sprite(spr_texture_black,-1,_tmp_x+(_j+1)*(CARDSPACING+card_width),deck_reveal_y);
					}
				}
			}
		}
		else {
			// show card in deck if revealed
			if (deck[_i][1] || deck_reveal_full) {
				var _sprite = spr_start_card_sm_back;
				for (var _j = 0; _j < array_length(start_card_stats); _j++) {
					if (struct_get(start_card_stats[_j][0],"name") == deck[_i][0]) {
						_sprite = struct_get(start_card_stats[_j][0],"image");
						break;
					}
				}
				draw_sprite(_sprite,-1,x+_i*deck_spacing,y-_i*deck_spacing);
			}
			// show card back if not revealed
			else draw_sprite(spr_start_card_sm_back,-1,x+_i*deck_spacing,y-_i*deck_spacing);
		}
	}
}