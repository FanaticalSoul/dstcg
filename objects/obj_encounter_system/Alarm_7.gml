/// @description exit encounter

// log action
sout("game won");
// update loot
save_data_loot();
// update file
save_data_deck(player);
// update encounter status
update_encounter_status();
// exit encounter
global.room_index = 2;
room_goto(global.room_index);