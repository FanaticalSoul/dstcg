/// @description Insert description here

//draw_set_color(c_black);
//draw_text(16,16,string(deck_reveal_offset));

var _deck_size = player.deck_size;
var _deck = player.deck;
var _sprites = player.sprites;

for (i = 0; i < _deck_size; i++) {
	if (_deck[i][0]>0) { // existing cards
		if (deck_reveal) {
			var _tmp_y = player.y-sprite_height-deck_reveal_spacing+deck_reveal_spacing/4;
			draw_sprite(spr_zone_hero_deck_reveal,-1,player.x-sprite_width/2,_tmp_y); // draw background
			var _above_hand_x = player.x+deck_reveal_spacing+deck_reveal_offset*(sprite_width+deck_reveal_spacing); // offset cards
			// tmp cordinate values
			var _tmp_x = _above_hand_x+i*(sprite_width+deck_reveal_spacing);

			// check bounds
			if (_tmp_x >= 0 && _tmp_x <= room_width) {
				// reverse card order to get an accurate view of upcoming cards
				var _reverse_card = _deck[player.deck_size-1-i];
				// only draw inside the room
				if (_reverse_card[1] || deck_reveal_full) draw_sprite(_sprites[_reverse_card[0]],-1,_tmp_x,_tmp_y);
				else draw_sprite(spr_card_back,-1,_tmp_x,_tmp_y);
				// hide missing cards
				if (_deck_size < deck_visable) {
					for (j = 0; j < deck_visable-_deck_size; j++) {
						draw_sprite(spr_card_blank,-1,_tmp_x+(j+1)*(deck_reveal_spacing+sprite_width),_tmp_y);
					}
				}
			}
		}
		else {
			// show card in deck if revealed
			if (_deck[i][1] || deck_reveal_full) draw_sprite(_sprites[_deck[i][0]],-1,x+i*deck_spacing,y-i*deck_spacing);
			// show card back if not revealed
			else draw_sprite(spr_card_back,-1,x+i*deck_spacing,y-i*deck_spacing);
		}
	}
}