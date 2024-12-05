/// @description Insert description here

// use parent
event_inherited();
// set selection // TF // WoL
var i, j = 0;
var _selection = get_data_file(file_deck)[1].inventory[0];
selection[j++] = "remnant of humanity";
for (i = 0; i < array_length(_selection); i++) {
	if (!array_contains(selection, _selection[i])) selection[j++] = _selection[i];
}
selection_size = j;
visible_selection = selection;
// set deck
set_sde_deck();
// set market
market = instance_create_depth(21, 168, depth, obj_sde_market, {visual_spoiler : visual_spoiler, deck_editor : id});