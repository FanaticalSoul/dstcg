/// @description draw health and stamina bars

// only start drawing when the game starts
if (global.phase_c_act || global.phase_react || global.phase_e_act) {
	if (instance_exists(player)) {
		if (
			instance_exists(player.discard) &&
			instance_exists(player.deck) &&
			is_array(player.hand)
		) {
			var _info_bars = [
				health_xscale_max,stamina_xscale_max,
				health_xscale_mid,stamina_xscale_mid,
				health_xscale_min,stamina_xscale_min
			];
			for (var i = 0; i < array_length(_info_bars); i++) {
				var _shade = c_white;
				if      (i==0||i==1) _shade = c_dkgray;
				else if (i==2||i==3) _shade = c_gray;
				else if (i==4||i==5) _shade = c_white;
				// draw sprite
				draw_sprite_stretched_ext(
					!(i%2) ? spr_health_bar : spr_stamina_bar, -1, x, 
					!(i%2) ? y : y+sprite_height,
					sprite_width*_info_bars[i], sprite_height,
					_shade, 1
				);
			}
		}
	}
}