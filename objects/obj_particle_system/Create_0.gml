// Create particle system
part_sys = part_system_create();
part_system_depth(part_sys, 0); // Set depth to control layer (adjust depth as needed)



lifetime_frames = 40;
lifetime_frames += 10;
increase_x_pixels = 4;
increase_y_pixels = 0;
particle_count = 1; // number of particles
// Create particle type
particle = part_type_create();

// Particle settings
part_type_sprite (particle,spr_particle_test,false,false,false); // particle sprite
// particle size

increase_x = increase_x_pixels/obj_hero_card.sprite_width/lifetime_frames;
//increase_y = increase_y_pixels/obj_hero_card.sprite_height/lifetime_frames;
increase_y = increase_y_pixels/1/lifetime_frames;
part_type_size_x(particle,1,1,increase_x,0);
part_type_size_y(particle,1,1,increase_y,0);
//part_type_color1(particle, c_white);             // Color of particles
part_type_alpha1(particle, 1); // opacity of particles
part_type_speed(particle, 0.1, 0.1, 0, 0); // speed (in pixels per frame)
//part_type_direction(particle, 90, 90, 0, 0); // direction of emission
part_type_life(particle, lifetime_frames, lifetime_frames); // lifetime of particles (in frames)
// Emit a burst of only a single particle
//part_particles_create(part_sys, x, y-24, particle, particle_count);  // Emit 1 particle
part_type_direction(particle, 90, 90, 0, 0); // direction of emission
part_particles_create(part_sys, x, y-obj_hero_card.sprite_height/2+1, particle, particle_count);  // Emit 1 particle
part_type_direction(particle, 360-90, 360-90, 0, 0); // direction of emission
part_particles_create(part_sys, x, y+obj_hero_card.sprite_height/2-1, particle, particle_count);  // Emit 1 particle

// Set a timer to destroy the system after particles fade out
alarm[0] = lifetime_frames;