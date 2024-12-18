/// @description draw object

if (instance_exists(player)) { // TF // only draw if player exists
	for (var i = 0; i < discard_size; i++) {
		if (discard[i] != "") { // existing cards
			// toggle reveal off if character is selected
			if (discard_reveal && instance_exists(player.character)) {
				if (player.character.selected) discard_reveal = false;
			}
			// display cards
			if (discard_reveal) {
				var _tmp_y = start_discard_reveal_cords[1];
				depth = -hand_max-1; // fixes bug with displaying over enemy cards
				draw_sprite(spr_reveal_board,-1,player.x-card_width/2,_tmp_y); // draw background
				var _above_hand_x = player.x+card_spacing+discard_reveal_offset*(card_width+card_spacing); // offset cards
				// tmp cordinate values
				var _tmp_x = _above_hand_x+i*(card_width+card_spacing);
				// check bounds
				if (_tmp_x >= 0 && _tmp_x <= room_width) {
					// reverse card order to get an accurate view of upcoming cards
					var _reverse_card = discard[discard_size-1-i];
					// only draw inside the room
					draw_sprite(struct_get(global.start_card_spr_sm, _reverse_card), -1, _tmp_x, _tmp_y);
					//* visual spoiler // v0.1.3-alpha
					var _card_stats = card_get_stats(start_card_stats, _reverse_card);
					spoil_revealed_card(_card_stats[0].image_hq, _tmp_x, _tmp_y);
					// visual spoiler /*/
					// hide missing cards
					if (discard_size < discard_visable) {
						for (var j = 0; j < discard_visable-discard_size; j++) {
							draw_sprite(spr_texture_black,-1,_tmp_x+(j+1)*(card_spacing+card_width), _tmp_y);
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