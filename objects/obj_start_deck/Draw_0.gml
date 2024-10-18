/// @description Insert description here

//draw_set_color(c_black);
//draw_text(16,16,string(deck_reveal_offset));

var _sprites = player.sprites;

for (i = 0; i < deck_size; i++) {
	if (deck[i][0]>0) { // existing cards
		if (deck_reveal) {
			draw_sprite(spr_zone_hero_deck_reveal,-1,player.x-sprite_width/2,deck_reveal_y); // draw background
			var _above_hand_x = player.x+deck_reveal_spacing+deck_reveal_offset*(sprite_width+deck_reveal_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(sprite_width+deck_reveal_spacing);

			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = deck[deck_size-1-i];
				// only draw inside the room
				if (_reverse_card[1] || deck_reveal_full) draw_sprite(_sprites[_reverse_card[0]],-1,_tmp_x,deck_reveal_y);
				else draw_sprite(spr_card_back,-1,_tmp_x,deck_reveal_y);
				// hide missing cards
				if (deck_size < deck_visable) {
					for (j = 0; j < deck_visable-deck_size; j++) {
						draw_sprite(spr_card_blank,-1,_tmp_x+(j+1)*(deck_reveal_spacing+sprite_width),deck_reveal_y);
					}
				}
			}
		}
		else {
			// show card in deck if revealed
			if (deck[i][1] || deck_reveal_full) draw_sprite(_sprites[deck[i][0]],-1,x+i*deck_spacing,y-i*deck_spacing);
			// show card back if not revealed
			else draw_sprite(spr_card_back,-1,x+i*deck_spacing,y-i*deck_spacing);
		}
	}
}