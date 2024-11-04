/// @description handle keybinds

// on [ mouse scroll ] // hand view navigation // no x-range // WoL
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 && hand_size > hand_size_visable) {
	var _hidden_cards = hand_size-hand_size_visable;
	if (mouse_wheel_up()   && hand_offset <  _hidden_cards/2) hand_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && hand_offset > -_hidden_cards/2) hand_offset -= 0.5; // decrement hand view
}

// press [ 4 ] // restart game (TF)
if (keyboard_check_pressed(4+48)) game_restart();

// press [ enter ] // draw a card (TF)
//if (keyboard_check_pressed(13)) with deck scr_start_card_draw();
// press [ enter ] // end activation phase
if (keyboard_check_pressed(13) && global.phase_c_act && obj_encounter.alarm[6] == -1) obj_encounter.alarm[6] = player.deck.card_draw_frame_delay;
// phase check //
/*

// DO NOT REMOVE


// THIS IS GOING TO BE MOVED INTO CHARACTER SO THAT AFTER RESOLVING DAMAGE
// THE ACTIVATIONS OF ENEMYS WILL CONTINUE
if (obj_enemy_deck.alarm[0] == -1 && obj_enemy_deck.alarm[1] == -1 && 
	alarm[3] == -1 && character_card.damage_taken == 0 && global.phase_e_act
) {
	alarm[3] = 1;
}
*/
with (character_card) {
	if (global.phase_e_act && !global.phase_react && damage_taken == 0) {
		with (obj_encounter) {
			if (alarm[4] == -1) {
				var _prior_enemy = e_deck.enemy_card[card_placement-1];
				if (instance_exists(_prior_enemy)) {
					alarm[4] = _prior_enemy.attack_animation_speed;
				}
				else alarm[4] = 1;
			}
		}
	}
}