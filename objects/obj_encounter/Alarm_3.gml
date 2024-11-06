/// @description start enemy act phase ( 4 )

global.phase_e_place = false;
// start enemy act phase
global.phase_e_act = true;
sout("phase 4 - enemy activation");
if (global.phase_e_act && alarm[4] == -1) {
	card_placement = 0;
	// skip activations of non-existant enemies
	while (card_placement < enemy_max) {
		if (!instance_exists(global.board_e_card[card_placement])) card_placement++;
		else break;
	}
	// activate card
	sout("the next phase has been removed temporarily");
	//TR//alarm[4] = e_deck.card_draw_frame_delay;
}