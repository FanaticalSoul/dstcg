/// @description draw enemies then start enemy activation phase
muligan_phase = false;
character_activation_phase = true; // TF
with (obj_enemy_deck) if (alarm[0] == -1) alarm[0] = 1;