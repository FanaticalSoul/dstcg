/// @description draw object

if (instance_exists(player)) { // TF // only draw if player exists
	for (var i = 0; i < discard_size; i++) {
		if (discard[i] != "") { // existing cards
			if (discard_reveal) {
				depth = -hand_max-1; // fixes bug with displaying over enemy cards
				draw_sprite(spr_reveal_board,-1,player.x-card_width/2,start_discard_reveal_cords[1]); // draw background
				var _above_hand_x = player.x+card_spacing+discard_reveal_offset*(card_width+card_spacing); // offset cards
				// tmp cordinate values
				var _tmp_x = _above_hand_x+i*(card_width+card_spacing);
				// check bounds
				if (_tmp_x >= 0 && _tmp_x <= room_width) {
					// reverse card order to get an accurate view of upcoming cards
					var _reverse_card = discard[discard_size-1-i];
					// only draw inside the room
					draw_sprite(struct_get(global.start_card_spr_sm, _reverse_card),-1,_tmp_x,start_discard_reveal_cords[1]);
					// hide missing cards
					if (discard_size < discard_visable) {
						for (var j = 0; j < discard_visable-discard_size; j++) {
							draw_sprite(spr_texture_black,-1,_tmp_x+(j+1)*(card_spacing+card_width),start_discard_reveal_cords[1]);
						}
					}
				}
			}
			else {
				depth = tmp_depth; // fixes bug with displaying over enemy cards
				var _sprite = spr_start_card_sm_front;
				// show card in discard
				draw_sprite(struct_get(global.start_card_spr_sm, discard[i]),-1,x+i*discard_spacing,y-i*discard_spacing);
			}
		}
	}
}