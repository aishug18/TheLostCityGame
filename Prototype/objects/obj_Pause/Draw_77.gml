// Disable alpha blending (we just want RGB from screen)
gpu_set_blendenable(false);

if (paused) {	// Draw frozen image to screen while paused
	surface_set_target(application_surface);
	
	if (surface_exists(pause_surface)) {
		draw_surface(pause_surface, 0, 0);
	}
	else {	/// Restore from buffer if we lost the surface
		pause_surface = surface_create(res_w, res_h);
		buffer_set_surface(pause_surf_buffer, pause_surface, 0);
	}
	
	surface_reset_target();
}

if (keyboard_check_pressed(vk_escape)) {	// Toggle pause
	if (!paused) {	// Pause now
		paused = true;
		
		// Deactivate everything other than this instance
		instance_deactivate_all(true);
		// this doesn't bause animating sprites or room backgrounds
		
		// Capture this game moment (won't capture draw GUI contents though)
		pause_surface = surface_create(res_w, res_h);
		surface_set_target(pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// Back up this surface to a buffer in case we lose it (screen focus, etc)
		//if (buffer_exists(pause_surf_buffer)) {
		//	buffer_delete(pause_surf_buffer);
		//}
		pause_surf_buffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surface, 0);
	}
	else {	// Unpause now
		paused = false;
		instance_activate_all();
		
		if (surface_exists(pause_surface)) {
			surface_free(pause_surface);
		}
		
		if (buffer_exists(pause_surf_buffer)) {
			buffer_delete(pause_surf_buffer);
		}
	}
}

// Enable alpha blending again
gpu_set_blendenable(true);