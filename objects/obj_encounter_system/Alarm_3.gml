/// @description start enemy act phase ( 4 )

global.phase_e_place = false;
global.phase_c_act = false; // end player activation
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
}