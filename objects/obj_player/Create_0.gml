/// @description create character, deck, hand, and phases

// (re)set offset
hand_offset = 0;
// create assossated deck
if (!instance_exists(deck) && alarm[0] == -1) alarm[0] = 1;
// create assossated character
if (!instance_exists(character) && alarm[1] == -1) alarm[1] = 1;
// set discard
if (!instance_exists(discard) && alarm[2] == -1) alarm[2] = 1;
// set hand
//sout(array_length(hand_card))
//sout(array_length(hand))
// hand should contain the start card instance id
if (array_length(hand) == 0 && alarm[3] == -1) alarm[3] = 1;
// set guages
if (!instance_exists(gauges) && alarm[4] == -1) alarm[4] = 1;
// set ui
if (alarm[5] == -1) alarm[5] = 1;
// track selected cards
selection = [];
selection_stamina = [];
// set target varibles for unique equipment and ranged attacks
act_equip_target = false;
act_equip_target_id = noone;
// states // these are not phases as they are only for the individual player
pay_stamina = false; 
// other varibles
last_valid_num = -1; // last valid number pressed on keyboard for this player
//inital_save = false;



function associated_instances_exist (player_id = id) {
	with (player_id) {
		if (!instance_exists(discard)) return false;
		else if (!instance_exists(deck)) return false;
		else if (!instance_exists(gauges)) return false;
		else if (!instance_exists(character)) return false;
		else return true;
	}
}