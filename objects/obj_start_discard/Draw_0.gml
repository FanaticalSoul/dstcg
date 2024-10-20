/// @description Insert description here
for (i = 0; i < discard_size; i++) {
	if (discard[i]!="") { // existing cards
		if (discard_reveal) {
			draw_sprite(spr_zone_hero_deck_reveal,-1,obj_player.x-sprite_width/2,discard_reveal_y); // draw background
			var _above_hand_x = obj_player.x+discard_reveal_spacing+discard_reveal_offset*(sprite_width+discard_reveal_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(sprite_width+discard_reveal_spacing);
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = discard[discard_size-1-i];
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
						draw_sprite(spr_texture_black,-1,_tmp_x+(_j+1)*(discard_reveal_spacing+sprite_width),discard_reveal_y);
					}
				}
			}
		}
		else {
			var _sprite = spr_start_card_sm_front;
			// show card in discard
			for (var _j = 0; _j < array_length(start_card_stats); _j++) {
				if (struct_get(start_card_stats[_j][0],"name") == discard[i]) {
					_sprite = struct_get(start_card_stats[_j][0],"image");
					break;
				}
			}
			draw_sprite(_sprite,-1,x+i*discard_spacing,y-i*discard_spacing);
		}
	}
}