/// @description end character activation phase


global.phase_c_act = false;

with (player) {
	// get actions back
	act_cycle = false;
	act_equip_use = false;
	act_attack = false;
	character.act_move = false;
	character.act_ability_target = false;
	//* TF // I do not believe these needed to be changed but I changed them just in case
	pay_stamina = false;
	global.phase_react = false;
	// TF /*/
	// unselect all cards
	card_unselect_all(id);
}
// end turn
if (get_enemy_count() > 0) {
	with (player.deck) if (alarm[0] == -1) alarm[0] = 1;
	// start enemy activations
	if (alarm[3] == -1) alarm[3] = 1;
}
else {
	// give player a choice to rest at a bonfire or draw back to 6 // WoL
	// default for now to drawing 6
	//sout("phase 6 - return to map");
	with (player.deck) {
		if (is_mouse_over_sprite()) {
			if (mouse_check_button_pressed(mb_left)) {
				//sout("draw hand");
				if (alarm[0] == -1) alarm[0] = 1;
			}
		}
	}
	
	with (player.discard) {
		if (is_mouse_over_sprite()) {
			if (mouse_check_button_pressed(mb_left)) {
				bonfire_rest(); // save loot
				//sout("go to bonfire");
			}
		}
	}
	if (alarm[6] == 0 && player.deck.alarm[0] == -1) alarm[6] = 1;
	//save_data_loot();
	//TR//
	//return_to_map();
	// TF
	//global.destroy_everything_test = true;
	// toggle off phases // this is true at this point
}
