/// @description encounter setup phases ( 1 )

// initalize varibles
card_placement = 0;
// set random seed
if (i_random_seed == -1) {
	randomize();
	global.random_seed = random_get_seed(); // use for replicating issues
}
else global.random_seed = i_random_seed;
// set global phases
global.phase_c_place  = i_phase_c_place;  // character placement
global.phase_mulligan = i_phase_mulligan; // muligan // sub phase
global.phase_e_place  = i_phase_e_place; // enemy placement
global.phase_e_act    = i_phase_e_act; // enemy activation
global.phase_react    = i_phase_react; // character reaction // sub phase
global.phase_c_act    = i_phase_c_act; // character activation
// log phase start
if (i_phase_c_place) sout("phase 1 - character placement");
// testing varribles
//player = obj_player;
//e_deck = obj_enemy_deck;
// other varibles
//WoL//global.souls = 0;

// TF
//global.destroy_everything_test = false;
//enemy_draw_flag = false; // use to mark if all enemy cards have been drawn