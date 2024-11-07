
/// @function					start_card_unselect([card_id]);
/// @param {id} card_id			id of the card
/// @description				unselect start card

function start_card_unselect (card_id = id) {
	with (card_id) {
		// unselect card
		selected = false;
		// remove card from player selection
		for (var i = 0; i < array_length(player.selection); i++) {
			if (player.selection[i] == id) {
				array_delete(player.selection,i,1);
				break;
			}
		}
	}
}

/// @function					start_card_stamina_unselect([card_id]);
/// @param {id} card_id			id of the card
/// @description				unselect a stamina card

function start_card_stamina_unselect (card_id = id) {
	with (card_id) {
		// unselect card
		selected = false;
		// remove card from player selection
		for (var i = 0; i < array_length(player.selection_stamina); i++) {
			if (player.selection_stamina[i] == id) {
				array_delete(player.selection_stamina,i,1);
				break;
			}
		}
	}
}

/// @function					card_unselect_all([player_id]);
/// @param {id} player_id		id of player
/// @description				unselect all of the player's cards

function card_unselect_all (player_id = id) {
	with (player_id) {
		if (character.selected) character.selected = false;
		while (array_length(selection_stamina) > 0) {
			with (selection_stamina[0]) start_card_stamina_unselect();
		}
		while (array_length(selection) > 0) {
			with (selection[0]) start_card_unselect();
		}
	}
}