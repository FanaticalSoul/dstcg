/// @description draw icons of actions taken

if (instance_exists(player) && global.phase_c_act) {
	var _x = x;
	with (player) {
		if (instance_exists(character)) {
			with (character) draw_sprite(spr_icon_m, act_move, _x+32*0, 32);
		}
		draw_sprite(spr_icon_a, act_attack, _x+32*1, 32);
		draw_sprite(spr_icon_e, act_equip_use, _x+32*2, 32);
		draw_sprite(spr_icon_c, act_cycle, _x+32*3, 32);
	}
}