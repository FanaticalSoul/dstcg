/// @description Insert description here

// set deck varibles
view_spacing = card_height; // space between views
visual_spoiler = instance_create_depth(0,0,depth-1,obj_start_deck_creator_spoiler, {deck_creator : id});
market = instance_create_depth(21, 168, depth, obj_sde_market, {visual_spoiler : visual_spoiler, deck_editor : id});
deck_size = 0; // cards in deck
deck_offset = 0;
// set selection varibles
var selection_max = 0;
selection_max += 16; // Class Cards
selection_max +=  1; // Remnant of Humanity Cards
selection_max += 40; // Common Treasure Cards
selection_max += 10; // Transposed Treasure Cards
selection_max +=  4; // Stamina Cards
selection_max +=  8; // Market Cards
for (var i = 0; i < selection_max; i++) selection[i] = "";
// initalize varibles
selection_offset = 0;
selection_size = 0;
// add filtered varibles
filtered_selection = undefined;
selection_filter = "";
filtered_selection_size = 0;
// set selection // TF // WoL
var i, j = 0;
var _selection = get_data_file(file_deck)[1].inventory[0];
selection[j++] = "remant of humanity";
for (i = 0; i < array_length(_selection); i++) {
	if (!array_contains(selection, _selection[i])) selection[j++] = _selection[i];
}
selection_size = j;
visible_selection = selection;
// set actual deck
set_sde_deck();