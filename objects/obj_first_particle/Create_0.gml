// Create the particle system
var _ps = part_system_create();
part_system_depth(_ps, depth);

part_system_draw_order(_ps, true);

// Create the particle type
var _ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_square);  // Square particles to align with card theme
//part_type_size(_ptype1, 0.25, 0.5, 0, 0);  // Smaller size to keep the effect subtle
part_type_size(_ptype1, 0.025, 0.05, 0, 0);  // Smaller size to keep the effect subtle
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 1, 1, 0, 0);      // Slower speed to keep the effect contained
//part_type_speed(_ptype1, 1, 2, 0, 0);      // Slower speed to keep the effect contained
part_type_direction(_ptype1, 0, 360, 0, 0); // Spread outward in all directions
part_type_gravity(_ptype1, 0, 270);         // No gravity
part_type_orientation(_ptype1, 0, 0, 0, 0, false); // No rotation
part_type_colour3(_ptype1, $7F7FFF, $FFFFFF, $FFEFBC); // Card-themed colors
part_type_alpha3(_ptype1, 1, 1, 0.5);       // Fade out towards the end
part_type_blend(_ptype1, true);             
part_type_life(_ptype1, 50, 50);            // Shorter lifespan to make the effect smaller and faster
//part_type_life(_ptype1, 15, 20);            // Shorter lifespan to make the effect smaller and faster

// Create the emitter
var _pemit1 = part_emitter_create(_ps);

// Adjust the emitter region to match the card size plus an 8-pixel border
// Card dimensions: 32x48, so region is -8 to 40 horizontally, and -8 to 56 vertically
part_emitter_region(_ps, _pemit1, -24, 24, -32, 32, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(_ps, _pemit1, _ptype1, 30); // Burst with fewer particles for a smaller effect

// Set system position at the card's position on the field (replace with your card's x/y position)

// Set system position at the card's position on the field (replace with your card's x/y position)
part_system_position(_ps, obj_hero_card.x, obj_hero_card.y);




// destroy