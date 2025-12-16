# SPRING.GD - Example with underwater force reduction
# This is an example - adapt based on your actual spring implementation

extends RigidBody2D

# Spring settings
const LAUNCH_FORCE = 1000.0
const SELF_RIGHTING_TORQUE = 500.0
const MAX_ANGULAR_VELOCITY = 3.0

var has_landed = false

func _ready():
	add_to_group("spring")
	# Start with gravity enabled
	gravity_scale = 1.0

func _physics_process(delta):
	# Self-righting behavior - try to stay upright
	if not has_landed:
		var angle = rotation
		# Normalize angle to -PI to PI
		while angle > PI:
			angle -= TAU
		while angle < -PI:
			angle += TAU
		
		# Apply torque to right the spring
		var torque = -angle * SELF_RIGHTING_TORQUE
		apply_torque(torque)
		
		# Limit angular velocity
		angular_velocity = clamp(angular_velocity, -MAX_ANGULAR_VELOCITY, MAX_ANGULAR_VELOCITY)

func _on_body_entered(body):
	# When spring lands on something, freeze it
	if not body.is_in_group("player"):
		has_landed = true
		freeze = true

func launch_player(player):
	"""Launch the player upward, with reduced force if underwater"""
	if player.has_method("apply_central_impulse") or player.has_method("set"):
		var launch_force = LAUNCH_FORCE
		
		# UNDERWATER CHECK - Reduce launch force when underwater
		if player.has("is_underwater") and player.is_underwater:
			launch_force *= 0.5  # 50% force underwater
			print("Underwater spring launch - reduced force: ", launch_force)
		else:
			print("Normal spring launch - full force: ", launch_force)
		
		# Apply the force
		if player.has_method("apply_central_impulse"):
			player.apply_central_impulse(Vector2(0, -launch_force))
		else:
			player.velocity.y = -launch_force


# ===== ALTERNATIVE: If you use a separate spring_detector.gd =====
# Put this code in your spring_detector.gd instead:
