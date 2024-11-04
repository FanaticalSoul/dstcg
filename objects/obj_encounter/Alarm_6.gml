/// @description end character activation phase
global.phase_c_act = false;
// toggle off character activations and activation phase
with (player) {
	// get actions back
	act_cycle = false;
	act_use_equip = false;
	act_attack = false;
	character_card.act_move = false;
	//* TF // I do not believe these needed to be changed but I changed them just in case
	pay_stamina = false;
	global.phase_react = false;
	// TF /*/
	// unselect all cards
	scr_card_unselect();
	/*
	if (character_card.selected) character_card.selected = false;
	while (array_length(stamina_selection) > 0) {
		with (stamina_selection[0]) scr_start_card_stamina_unselect();
	}
	while (array_length(selection) > 0) {
		with (selection[0]) scr_start_card_unselect();
	}
	*/
}
// end turn
if (e_deck.enemy_count > 0) {
	with (player.deck) if (alarm[0] == -1) alarm[0] = card_draw_frame_delay;
	// start enemy activations
	if (alarm[3] == -1) alarm[3] = e_deck.card_draw_frame_delay;
}
else {
	// give player a choice to rest at a bonfire or draw back to 6 // WoL
	// default for now to drawing 6
	sout("phase 6 - WoL");
	with (player.deck) if (alarm[0] == -1) alarm[0] = card_draw_frame_delay;
	// TF
	//global.destroy_everything_test = true;
	// toggle off phases // this is true at this point
}