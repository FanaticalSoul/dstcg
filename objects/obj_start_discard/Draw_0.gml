/// @description draw object
for (var _i = 0; _i < discard_size; _i++) {
	if (discard[_i]!="") { // existing cards
		if (discard_reveal) {
			depth = -hand_max-1; // fixes bug with displaying over enemy cards
			draw_sprite(spr_reveal_board,-1,player.x-card_width/2,discard_reveal_y); // draw background
			var _above_hand_x = player.x+card_spacing+discard_reveal_offset*(card_width+card_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+_i*(card_width+card_spacing);
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = discard[discard_size-1-_i];
				// only draw inside the room
				var _sprite = spr_start_card_sm_front;
				for (var _j = 0; _j < array_length(start_card_stats); _j++) {
					if (struct_get(start_card_stats[_j][0],"name") == _reverse_card) {
						_sprite = struct_get(start_card_stats[_j][0],"image");
						break;
					}
				}
				draw_sprite(_sprite,-1,_tmp_x,discard_reveal_y);
				// hide missing cards
				if (discard_size < discard_visable) {
					for (var _j = 0; _j < discard_visable-discard_size; _j++) {
						draw_sprite(spr_texture_black,-1,_tmp_x+(_j+1)*(card_spacing+card_width),discard_reveal_y);
					}
				}
			}
		}
		else {
			depth = tmp_depth; // fixes bug with displaying over enemy cards
			var _sprite = spr_start_card_sm_front;
			// show card in discard
			for (var _j = 0; _j < array_length(start_card_stats); _j++) {
				if (struct_get(start_card_stats[_j][0],"name") == discard[_i]) {
					_sprite = struct_get(start_card_stats[_j][0],"image");
					break;
				}
			}
			draw_sprite(_sprite,-1,x+_i*discard_spacing,y-_i*discard_spacing);
		}
	}
}