extends Area2D

# Bubble settings - UPDATED: lifetime 6s instead of 15s
@export var rise_speed := 80.0  # Pixels per second upward
@export var wobble_amount := 20.0  # How much it wobbles left/right
@export var lifetime := 6.0  # Was 15.0 - shorter lifetime

# Growth stages - 4 stages with 3x max size
var growth_stages = [0.5, 0.8, 1.0, 3.0]  # Scale multipliers - final stage is 3x!
var current_stage = 0
var growth_timer = 0.0
var growth_interval = 0.5  # Time between growth stages

# Movement
var wobble_offset = 0.0
var time_alive = 0.0

# Visual
var bubble_visual: ColorRect = null

func _ready():
	add_to_group("air_bubble")
	
	# Set collision
	collision_layer = 4  # Bubbles on layer 4
	collision_mask = 1   # Detect player on layer 1
	
	# Create visual
	bubble_visual = ColorRect.new()
	bubble_visual.color = Color(0.6, 0.9, 1.0, 0.5)  # Light blue, semi-transparent
	bubble_visual.size = Vector2(30, 30)
	bubble_visual.position = Vector2(-15, -15)  # Center it
	add_child(bubble_visual)
	
	# Create collision shape
	var collision = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = 15
	collision.shape = circle
	add_child(collision)
	
	# Start at smallest size
	scale = Vector2(growth_stages[0], growth_stages[0])
	
	# Connect signal
	body_entered.connect(_on_body_entered)
	
	# Random wobble offset
	wobble_offset = randf() * TAU

func _process(delta):
	time_alive += delta
	
	# Auto-delete after lifetime
	if time_alive >= lifetime:
		queue_free()
		return
	
	# Delete if bubble reaches top of well (y = 0 or above)
	if global_position.y <= 0:
		queue_free()
		return
	
	# Growth animation
	if current_stage < growth_stages.size() - 1:
		growth_timer += delta
		if growth_timer >= growth_interval:
			growth_timer = 0.0
			current_stage += 1
			var target_scale = growth_stages[current_stage]
			# Smooth scale transition
			var tween = create_tween()
			tween.tween_property(self, "scale", Vector2(target_scale, target_scale), 0.3)
			print("Bubble growing to stage ", current_stage, " (scale: ", target_scale, ")")
	
	# Rise upward with wobble
	var wobble_x = sin(time_alive * 2.0 + wobble_offset) * wobble_amount * delta
	position.y -= rise_speed * delta
	position.x += wobble_x
	
	# Subtle rotation
	rotation = sin(time_alive * 1.5) * 0.1

func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("reset_air_timer"):
		print("Player collected air bubble!")
		body.reset_air_timer()
		
		# Visual feedback - flash and delete
		if bubble_visual:
			bubble_visual.color = Color(1.0, 1.0, 1.0, 1.0)  # Flash white
		
		# Pop effect - grow then delete
		var tween = create_tween()
		tween.tween_property(self, "scale", scale * 1.5, 0.1)
		tween.tween_callback(queue_free)
