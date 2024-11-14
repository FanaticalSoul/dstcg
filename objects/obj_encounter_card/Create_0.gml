/// @description Insert description here

card_hq = obj_visual_spoiler;

card_stats = card_get_stats(encounter_card_stats, card_name);

sprite_index = card_stats.image;

flip_scale_x = 1;

sout("created encounter card ( "+card_name+" )");