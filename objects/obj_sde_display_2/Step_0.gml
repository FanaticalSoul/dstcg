/// @description Insert description here
// You can write your code in this editor

if (instance_exists(deck_editor)) {
	if (is_mouse_over_sprite()) {
		if (mouse_check_button(mb_right)) {
			spoil_bonfire(deck_editor.visual_spoiler);
		}
	}
}