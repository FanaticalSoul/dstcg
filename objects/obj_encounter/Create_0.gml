/// @description encounter setup phases
randomize();
global.random_seed = random_get_seed(); // use for replicating issues
// initalize varibles
card_placement = 0;
// encounter phases
global.phase_c_place  = true;  // character placement
global.phase_mulligan = false; // muligan // sub phase
global.phase_e_place  = false; // enemy placement
global.phase_e_act    = false; // enemy activation
global.phase_react    = false; // character reaction // sub phase
global.phase_c_act    = false; // character activation
///sout("EVERYTHING WAS CREATED");
sout("phase 1 - character placement");
// testing varribles
player = obj_player;
e_deck = obj_enemy_deck;
// other varibles
global.souls = 0;