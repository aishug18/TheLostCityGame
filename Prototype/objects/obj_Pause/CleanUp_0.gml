if (surface_exists(pause_surface)) {
	surface_free(pause_surface);
}
		
if (buffer_exists(pause_surf_buffer)) {
	buffer_delete(pause_surf_buffer);
}