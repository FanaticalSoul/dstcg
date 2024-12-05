/// @description Insert description here

// set deck varibles
view_spacing = card_height; // space between views
visual_spoiler = instance_create_depth(0,0,depth-1,obj_start_deck_creator_spoiler, {deck_creator : id});
deck_size = 0; // cards in deck
deck_offset = 0;
// set selection varibles
var _selection_max = 0;
_selection_max += 16; // Class Cards
_selection_max +=  1; // Remnant of Humanity Cards
_selection_max += 40; // Common Treasure Cards
_selection_max += 10; // Transposed Treasure Cards
_selection_max +=  4; // Stamina Cards
_selection_max +=  8; // Market Cards
for (var i = 0; i < _selection_max; i++) selection[i] = "";

// initalize varibles
selection_offset = 0;
selection_size = 0;
// add filtered varibles
filtered_selection = undefined;
selection_filter = "";
filtered_selection_size = 0;