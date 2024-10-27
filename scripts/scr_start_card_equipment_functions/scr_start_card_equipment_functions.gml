function scr_equipment_remant_of_humanity_1 (_id) {
	with (_id) {
		if (!player.action_use_equipment) {
			with (player.start_deck.discard) scr_start_card_discard(_id);
			with (player.start_deck) scr_start_card_draw ();
			player.action_use_equipment = true;
		}
	}
	return;
}

function scr_equipment_talisman_2 (_id,_heal) {
	with (_id) {
		if (!player.action_use_equipment) {
			with (player.start_deck) {
				scr_start_card_heal(_heal);
				player.action_use_equipment = true;
			}
		}
	}
	return;
}