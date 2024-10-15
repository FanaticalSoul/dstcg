/// @description Insert description here

/*
draw_set_color(c_black);

draw_text(16,16,string(mouse_x)+" "+string(mouse_y));

*/

for (i = 0; i < deck_size; i++) {
	if (deck[i]>0) {
		// existing card
		//draw_sprite(spr_card_back,-1,x+i*deck_spacing,y-i*deck_spacing); // show card backs in deck
		draw_sprite(sprites[deck[i]],-1,x+i*deck_spacing,y-i*deck_spacing); // show cards in deck
	}
}