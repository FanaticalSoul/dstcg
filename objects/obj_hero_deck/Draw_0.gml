/// @description Insert description here

/*
draw_set_color(c_black);

draw_text(16,16,string(mouse_x)+" "+string(mouse_y));


draw_set_color(c_black);

draw_text(16,16,string(deck_reveal_offset));
*/



var _deck_size = player.deck_size;
var _deck = player.deck;
var _sprites = player.sprites;

for (i = 0; i < _deck_size; i++) {
	if (_deck[i][0]>0) {
		// existing card
		if (deck_reveal) {

			// draw background
			draw_sprite(spr_player_deck_reveal,-1,field_offset,player.y-sprite_height);
			
			var _above_hand_x = player.x+deck_reveal_spacing+field_offset;
			var _above_hand_y = player.y-sprite_height-deck_reveal_spacing;
			_above_hand_x += deck_reveal_offset*(sprite_width+deck_reveal_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(sprite_width+deck_reveal_spacing);
			var _tmp_y = _above_hand_y+deck_reveal_spacing/4;
			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width-sprite_width) {
				
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = _deck[player.deck_size-1-i];
				// only draw inside the room
				if (_reverse_card[1] || deck_reveal_full) {
					draw_sprite(_sprites[_reverse_card[0]],-1,_tmp_x,_tmp_y);
				}
				else {
					draw_sprite(spr_card_back,-1,_tmp_x,_tmp_y);
				}
				
				// hide missing cards
				if (_deck_size < deck_visable) {
					for (j = 0; j < deck_visable-_deck_size; j++) {
						draw_sprite(spr_card_blank,-1,_tmp_x+(j+1)*(deck_reveal_spacing+sprite_width),_tmp_y);
					}
				}
			}

		}
		else {
			if (_deck[i][1] || deck_reveal_full) {
				// show card in deck if revealed
				draw_sprite(_sprites[_deck[i][0]],-1,x+i*deck_spacing,y-i*deck_spacing);
			}
			else {
				// show card back if not revealed
				draw_sprite(spr_card_back,-1,x+i*deck_spacing,y-i*deck_spacing);
			}
		}
	}
}
