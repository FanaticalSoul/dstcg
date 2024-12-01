/// @description Insert description here

card_hq = obj_visual_spoiler;

sprite_index = card_get_stats(encounter_card_stats, card_name).image;

flip_scale_x = 1;

sout("created encounter card ( "+card_name+" )");


function check_encounter_paths () {
	var _flag = false;
	if (array_length(encounter_paths) > 0) {
		for (var i = 0; i < array_length(encounter_paths); i++) {
			if (encounter_paths[i].cleared) {
				_flag = true;
				break;
			}
		}
	}
	else _flag = true;
	return _flag;
}