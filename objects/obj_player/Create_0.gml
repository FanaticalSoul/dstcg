/// @description create character, deck, hand, and phases

// create assossated deck
if (deck == noone && alarm[0] == -1) alarm[0] = 1;
// create assossated character
if (character == noone && alarm[1] == -1) alarm[1] = 1;
// set hand
if (array_length(hand_card) == 0 && array_length(hand) == 0 && alarm[3] == -1) alarm[3] = 1;
// track selected cards
selection = [];
stamina_selection = [];
// actions taken
//act_cycle = false; // cycled selected cards in hand
//act_use_equip = false; // equipment was used for a non-attack action
//act_attack = false; // attacked with equipment
// states // these are not phases as they are only for the individual player
pay_stamina = false; 
// other varibles
last_valid_num = -1; // last valid number pressed on keyboard for this player