/// @description Insert description here

/*
draw_set_color(c_black);

draw_text(16,16,string(mouse_x)+" "+string(mouse_y));

*/
for (i = 0; i < deck_size; i++) {
	
	
	
	
	
	if (deck[i][0]>0) {
		// existing card
		if (deck_reveal) {
			var _above_hand_x = obj_hero_hand.x;
			var _above_hand_y = obj_hero_hand.y-sprite_height;
			if (deck[i][1]) {draw_sprite(sprites[deck[i][0]],-1,_above_hand_x+i*sprite_width,_above_hand_y);}
			else {draw_sprite(spr_card_back,-1,_above_hand_x+i*sprite_width,_above_hand_y);}
		}
		else {
			if (deck[i][1]) {
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