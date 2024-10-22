/// @description create particle system
// offset_pixels // how much the particles are hidden by the object they are under
// lifetime_frames // adjust this instead of speed
// particle_count // number of particles
// set varibles
card_width  = SMCARDSIZEX;
card_height = SMCARDSIZEY;
part_sys = part_system_create();
// do calculations
offset_frames = offset_pixels*(lifetime_frames/increase_pixels);
lifetime_frames += offset_frames;
particle_speed = 1/(lifetime_frames/(increase_pixels+offset_pixels));
// create particle type
particle_x = part_type_create();
particle_y = part_type_create();
// particle settings
part_type_speed(particle_x, particle_speed, particle_speed, 0, 0); // speed (in pixels per frame)
part_type_speed(particle_y, particle_speed, particle_speed, 0, 0); // speed (in pixels per frame)
part_type_life(particle_x, lifetime_frames, lifetime_frames); // lifetime of particles (in frames)
part_type_life(particle_y, lifetime_frames, lifetime_frames); // lifetime of particles (in frames)
// set vertical particles
part_type_sprite (particle_x,spr_particle_x,false,false,false); // particle sprite
increase_x = increase_pixels/card_width/lifetime_frames;
increase_y = 0;
part_type_size_x(particle_x,1,1,increase_x,0);
part_type_size_y(particle_x,1,1,increase_y,0);
// emit a burst of only a single particle
part_type_direction(particle_x, 90, 90, 0, 0); // direction of emission
part_particles_create(part_sys, x, y-card_height/2+offset_pixels, particle_x, particle_count);
// emit a burst of only a single particle
part_type_direction(particle_x, 360-90, 360-90, 0, 0); // direction of emission
part_particles_create(part_sys, x, y+card_height/2-1-offset_pixels, particle_x, particle_count);
// set horizontal particles
part_type_sprite (particle_y,spr_particle_y,false,false,false); // particle sprite
increase_x = 0;
increase_y = increase_pixels/card_height/lifetime_frames;
part_type_size_x(particle_y,1,1,increase_x,0);
part_type_size_y(particle_y,1,1,increase_y,0);
// emit a burst of only a single particle
part_type_direction(particle_y, 180, 180, 0, 0); // direction of emission
part_particles_create(part_sys, x-card_width/2+offset_pixels, y, particle_y, particle_count);
// emit a burst of only a single particle
part_type_direction(particle_y, 0, 0, 0, 0); // direction of emission
part_particles_create(part_sys, x+card_width/2-1-offset_pixels, y, particle_y, particle_count);
// Set a timer to destroy the system after particles fade out
alarm[0] = lifetime_frames;