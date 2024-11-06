/// @description draw object
for (var i = 0; i < discard_size; i++) {
	if (discard[i] != "") { // existing cards
		if (discard_reveal) {
			depth = -hand_max-1; // fixes bug with displaying over enemy cards
			draw_sprite(spr_reveal_board,-1,player.x-card_width/2,discard_reveal_y); // draw background
			var _above_hand_x = player.x+card_spacing+discard_reveal_offset*(card_width+card_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(card_width+card_spacing);
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = discard[discard_size-1-i];
				// only draw inside the room
				var _sprite = spr_start_card_sm_front;
				for (var j = 0; j < array_length(start_card_stats); j++) {
					if (struct_get(start_card_stats[j][0],"name") == _reverse_card) {
						_sprite = struct_get(start_card_stats[j][0],"image");
						break;
					}
				}
				draw_sprite(_sprite,-1,_tmp_x,discard_reveal_y);
				// hide missing cards
				if (discard_size < discard_visable) {
					for (var j = 0; j < discard_visable-discard_size; j++) {
						draw_sprite(spr_texture_black,-1,_tmp_x+(j+1)*(card_spacing+card_width),discard_reveal_y);
					}
				}
			}
		}
		else {
			depth = tmp_depth; // fixes bug with displaying over enemy cards
			var _sprite = spr_start_card_sm_front;
			// show card in discard
			for (var j = 0; j < array_length(start_card_stats); j++) {
				if (start_card_stats[j][0].name == discard[i]) {
					_sprite = start_card_stats[j][0].image;
					break;
				}
			}
			draw_sprite(_sprite,-1,x+i*discard_spacing,y-i*discard_spacing);
		}
	}
}