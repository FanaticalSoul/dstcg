/// @description end character activation phase
// toggle off character activations and activation phase
character_activation_phase = false;
action_cycle = false;
action_use_equipment = false;
action_attack = false;
action_pay_stamina = false;
reaction = false;
character_card.action_movement = false;
// unselect all cards
if (character_card.selected) character_card.selected = false;
while (array_length(stamina_selection) > 0) {
	with (stamina_selection[0]) scr_start_card_stamina_unselect();
}
while (array_length(selection) > 0) {
	with (selection[0]) scr_start_card_unselect();
}
// end turn
if (obj_enemy_deck.enemy_count > 0) {
	with (deck) if (alarm[0] == -1) alarm[0] = 1;
	// start enemy activations
	character_activation_phase = false;
	enemy_activation_phase = true;
	if (obj_enemy_deck.alarm[1] == -1) obj_enemy_deck.alarm[1] = max((hand_max-hand_size)*deck.card_draw_frame_delay,1);
}
else {
	// give player a choice to rest at a bonfire or draw back to 6 // WoL
	sout("give player a choice to rest at a bonfire or draw back to 6");
	sout("the player will just draw back to 6 for now");
	// default for now to drawing 6
	with (deck) if (alarm[0] == -1) alarm[0] = 1;
	// toggle off phases
	character_activation_phase = false;
}