/// @description Insert description here
if (step > -1) {
	if      (characters[step] == "herald"  ) sprite_index = spr_icon_character_herald;
	else if (characters[step] == "assassin") sprite_index = spr_icon_character_assassin;
	else if (characters[step] == "knight"  ) sprite_index = spr_icon_character_knight;
	else if (characters[step] == "sorcerer") sprite_index = spr_icon_character_sorcerer;
	//else sprite_index = spr_menu_start_cancel;
}
else sprite_index = spr_menu_start_cancel;