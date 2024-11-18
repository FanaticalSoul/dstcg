/// @description Insert description here
// You can write your code in this editor

//loading = 0;

load_bar_xscale  = 1;
load_bar_1_spr_x = 2;
load_bar_2_spr_x = 64;
load_bar_1_spr_y = 2;


var _card_stats = [
	character_card_stats, // image_hq_front // image_hq_back
	enemy_card_stats, // image_hq
	start_card_stats, // [0].image_hq
	encounter_card_stats // image_hq
];

sprites = [];
i = 0;
for (i = 0; i < array_length(_card_stats); i++) {
	for (var j = 0; j < array_length(_card_stats[i]); j++) {
		var _card = _card_stats[i][j];
		sout(_card);
		if (i+1 == 1){
			array_push(sprites, _card.image_hq_front);
			array_push(sprites, _card.image_hq_back );
		}
		else if (i+1 == 3) {
			array_push(sprites, _card[0].image_hq);
		}
		else {
			array_push(sprites, _card.image_hq);
		}
	}
}
i = 0;