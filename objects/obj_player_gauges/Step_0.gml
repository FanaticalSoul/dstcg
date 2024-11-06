/// @description scale health bar width


if (instance_exists(player)) {
	if (
		instance_exists(player.discard) &&
		instance_exists(player.deck) &&
		is_array(player.hand)
	) {
		// update stamina count
		health_count  = 0;
		stamina_count = 0;
		//sout("hand info");
		//sout(["player exists",instance_exists(player)]);

		//sout(player.hand_size);
		var _card_zones = [
			[player.deck.deck,player.deck.deck_size],
			[player.hand,player.hand_size]
		];
		for (var i = 0; i < array_length(_card_zones); i++) {
			array_foreach(_card_zones[i][0],increment_health_count ,0,_card_zones[i][1]);
			array_foreach(_card_zones[i][0],increment_stamina_count,0,_card_zones[i][1]);
		}
		// get max stamina
		health_max  = 0;
		stamina_max = 0;
		array_push(_card_zones,[player.discard.discard,player.discard.discard_size]);
		for (var i = 0; i < array_length(_card_zones); i++) {
			array_foreach(_card_zones[i][0],increment_health_max ,0,_card_zones[i][1]);
			array_foreach(_card_zones[i][0],increment_stamina_max,0,_card_zones[i][1]);
		}
		// scale images
		health_xscale      = health_count  / (max_deck * 1) * ending_sprite_width/sprite_width;
		health_xscale_max  = health_max    / (max_deck * 1) * ending_sprite_width/sprite_width;
		stamina_xscale     = stamina_count / (max_deck * 2) * ending_sprite_width/sprite_width;
		stamina_xscale_max = stamina_max   / (max_deck * 2) * ending_sprite_width/sprite_width;
	}
}