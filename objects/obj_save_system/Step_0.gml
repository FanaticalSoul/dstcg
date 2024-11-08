/// @description Insert description here
// You can write your code in this editor


while (!save_game_flag) {
	if (!instance_exists(obj_enemy_deck)) break;
	if (!instance_exists(obj_encounter_system)) break;
	if (!instance_exists(player_save_id)) break;
	else {
		if (!instance_exists(player_save_id.character)) break;
		if (!instance_exists(player_save_id.deck)) break;
		if (!instance_exists(player_save_id.discard)) break;
		if (!instance_exists(player_save_id.gauges)) break;
		save_game(player_save_id);
		save_game_flag = true;
	}
}