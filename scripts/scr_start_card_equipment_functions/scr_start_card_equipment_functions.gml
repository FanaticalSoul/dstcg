function scr_equipment_remant_of_humanity_1 (id) {
	with (id) {
		if (!player.action_use_equipment) {
			with (player.start_deck.discard) scr_start_card_discard(_id);
			with (player.start_deck) scr_start_card_draw ();
			player.action_use_equipment = true;
		}
	}
}

function scr_equipment_talisman_2 (id) {
	with (id) {
		if (!player.action_use_equipment) {
			with (player.start_deck) {
				scr_start_card_heal(5);
				player.action_use_equipment = true;
			}
		}
	}
}