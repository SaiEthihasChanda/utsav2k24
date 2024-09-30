extends Camera

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var raycast = self.get_node("RayCast")
	var mesh_instance = self.get_node("MeshInstance")
	
	if raycast.is_colliding():
		# Get the collision point and normal of the surface
		var collision_point = raycast.get_collision_point()
		var collision_normal = raycast.get_collision_normal()

		# Show the MeshInstance
		mesh_instance.show()

		# Set the MeshInstance's position to the collision point
		mesh_instance.global_transform.origin = collision_point
		
		# Align the MeshInstance with the surface normal using look_at
		var target_position = collision_point + collision_normal
		mesh_instance.look_at(target_position, Vector3.UP)

	else:
		# Hide the MeshInstance when not colliding
		mesh_instance.hide()
