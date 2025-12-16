extends Area2D

func _ready():
	# Make sure we're detecting the player
	collision_layer = 0  # Spring detector doesn't collide
	collision_mask = 1   # Detects player on layer 1
	
	# Connect signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		var parent_spring = get_parent()
		
		# Get the launch force from parent spring (correct syntax)
		var launch_force = parent_spring.get("LAUNCH_FORCE")
		if launch_force == null:
			launch_force = 1000.0  # Default if not found
		
		# UNDERWATER CHECK - Reduce force if player is underwater
		if "is_underwater" in body and body.is_underwater:
			launch_force *= 0.7  # 70% force underwater (was 50% - now bouncier!)
			print("Underwater spring - reduced force: ", launch_force)
		else:
			print("Normal spring - full force: ", launch_force)
		
		# Apply the force
		body.velocity.y = -launch_force
