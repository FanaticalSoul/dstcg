/// @description start character activation
global.phase_e_act = false;
if (player.deck.alarm[0] == -1) {
	player.deck.alarm[0] = player.deck.card_draw_frame_delay; // draw opening hand
}
global.phase_c_act = true;
sout("phase 5 - character activation");