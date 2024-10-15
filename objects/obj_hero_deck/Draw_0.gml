/// @description Insert description here

/*
draw_set_color(c_black);

draw_text(16,16,string(mouse_x)+" "+string(mouse_y));

*/
draw_set_color(c_black);

draw_text(16,16,string(deck_reveal_offset));

for (i = 0; i < deck_size; i++) {
	if (deck[i][0]>0) {
		// existing card
		if (deck_reveal) {
			// draw background
			draw_sprite(spr_player_deck_reveal,-1,0,obj_hero_hand.y-sprite_height);
			var _above_hand_x = obj_hero_hand.x+deck_reveal_spacing;
			var _above_hand_y = obj_hero_hand.y-sprite_height-deck_reveal_spacing;
			_above_hand_x += deck_reveal_offset*(sprite_width+deck_reveal_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(sprite_width+deck_reveal_spacing);
			var _tmp_y = _above_hand_y+deck_reveal_spacing/4;
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width-sprite_width) {
				// only draw inside the room
				if (deck[i][1] || deck_reveal_full) {
					draw_sprite(sprites[deck[i][0]],-1,_tmp_x,_tmp_y);
				}
				else {
					draw_sprite(spr_card_back,-1,_tmp_x,_tmp_y);
				}
			}
		}
		else {
			if (deck[i][1] || deck_reveal_full) {
				// show card in deck if revealed
				draw_sprite(sprites[deck[i][0]],-1,x+i*deck_spacing,y-i*deck_spacing);
			}
			else {
				// show card back if not revealed
				draw_sprite(spr_card_back,-1,x+i*deck_spacing,y-i*deck_spacing);
			}
		}
	}
}