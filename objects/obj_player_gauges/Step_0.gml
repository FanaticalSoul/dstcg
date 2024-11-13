/// @description scale health bar width

// only start updating when the game starts
if (global.phase_c_act || global.phase_react || global.phase_e_act) {
	if (instance_exists(player)) {
		if (
			instance_exists(player.discard) &&
			instance_exists(player.deck) &&
			is_array(player.hand)
		) {
			// update stamina count
			var _card_zones = [];
			// get min stamina
			array_push(_card_zones,[player.hand,player.hand_size]);
			health_min  = 0;
			stamina_min = 0;
			for (var i = 0; i < array_length(_card_zones); i++) {
				array_foreach(_card_zones[i][0],increment_health_min ,0,_card_zones[i][1]);
				array_foreach(_card_zones[i][0],increment_stamina_min,0,_card_zones[i][1]);
			}
			// get mid stamina
			array_push(_card_zones,[player.deck.deck,player.deck.deck_size]);
			health_mid  = 0;
			stamina_mid = 0;
			for (var i = 0; i < array_length(_card_zones); i++) {
				array_foreach(_card_zones[i][0],increment_health_mid ,0,_card_zones[i][1]);
				array_foreach(_card_zones[i][0],increment_stamina_mid,0,_card_zones[i][1]);
			}
			// get max stamina
			array_push(_card_zones,[player.discard.discard,player.discard.discard_size]);
			health_max  = 0;
			stamina_max = 0;
			for (var i = 0; i < array_length(_card_zones); i++) {
				array_foreach(_card_zones[i][0],increment_health_max ,0,_card_zones[i][1]);
				array_foreach(_card_zones[i][0],increment_stamina_max,0,_card_zones[i][1]);
			}
			sout(["H",health_min,health_mid,health_max]);
			sout(["S",stamina_min,stamina_mid,stamina_max]);
			// scale images
			health_xscale_min  = health_min  / (deck_max * 1) * ending_sprite_width/sprite_width;
			health_xscale_mid  = health_mid  / (deck_max * 1) * ending_sprite_width/sprite_width;
			health_xscale_max  = health_max  / (deck_max * 1) * ending_sprite_width/sprite_width;
			stamina_xscale_min = stamina_min / (deck_max * 2) * ending_sprite_width/sprite_width;
			stamina_xscale_mid = stamina_mid / (deck_max * 2) * ending_sprite_width/sprite_width;
			stamina_xscale_max = stamina_max / (deck_max * 2) * ending_sprite_width/sprite_width;
		}
	}
}