extends Area2D

# Water settings - UPDATED FOR SLOWER RISE
@export var initial_rise_speed := 40.0   # Was 100.0 - much slower start
@export var rise_acceleration := 3.0     # Was 10.0 - slower acceleration
@export var max_rise_speed := 150.0      # Was 300.0 - lower top speed
@export var max_height := 0.0            # Where to stop rising (set by chamber generator)

var is_rising := false
var current_height := 0.0
var current_rise_speed := 40.0  # Starts at initial_rise_speed
var water_visual: ColorRect = null
var initial_y := 0.0

func _ready():
	print("=== WATER: _ready() called ===")
	add_to_group("water")
	
	# Set collision layers/masks
	collision_layer = 2  # Water exists on layer 2
	collision_mask = 1   # Water detects things on layer 1 (player, platforms)
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Create visual
	water_visual = ColorRect.new()
	water_visual.color = Color(0.2, 0.4, 0.8, 0.6)  # Blue semi-transparent
	water_visual.z_index = 50  # Above platforms but below player
	add_child(water_visual)
	print("Water visual created, color: ", water_visual.color)
	
	# Create collision shape
	var collision = CollisionShape2D.new()
	collision.name = "CollisionShape2D"
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = Vector2(100, 100)  # Start with small size
	collision.shape = rect_shape
	add_child(collision)
	print("Collision shape created")
	
	initial_y = global_position.y
	current_rise_speed = initial_rise_speed
	print("Water initial position: ", global_position)
	print("Water initial_y: ", initial_y)

func _process(delta):
	if is_rising and current_height < max_height:
		# Accelerate over time
		current_rise_speed += rise_acceleration * delta
		current_rise_speed = min(current_rise_speed, max_rise_speed)
		
		# Rise upward
		var old_height = current_height
		current_height += current_rise_speed * delta
		current_height = min(current_height, max_height)
		
		# Update visual
		update_water_visual()
		
		# Debug print every 500 pixels
		if int(current_height) % 500 == 0 and old_height != current_height:
			print("Water height: ", current_height, " / ", max_height, " Speed: ", current_rise_speed)
	elif is_rising and current_height >= max_height:
		# Water has reached the top
		is_rising = false
		print("Water reached the top!")

func start_rising():
	"""Call this when player picks up loot"""
	is_rising = true
	current_rise_speed = initial_rise_speed
	print("=== WATER: START RISING ===")
	print("Initial rise speed: ", initial_rise_speed)
	print("Acceleration: ", rise_acceleration)
	print("Max rise speed: ", max_rise_speed)
	print("Max height: ", max_height)
	print("Starting from Y: ", global_position.y)

func stop_rising():
	"""Stop the water from rising"""
	is_rising = false
	print("Water stopped rising at height: ", current_height)

func set_water_width(width: float):
	"""Set the width of the water to match chamber width"""
	if water_visual:
		water_visual.size.x = width
		print("Water width set to: ", width)

func update_water_visual():
	"""Update the visual representation of water"""
	if water_visual:
		# Visual grows upward from the bottom
		water_visual.size.y = current_height
		water_visual.position.y = -current_height  # Top of water
		water_visual.position.x = 0
		
		# Update collision shape to match
		var collision = get_node_or_null("CollisionShape2D")
		if collision and collision.shape:
			collision.shape.size = Vector2(water_visual.size.x, current_height)
			# Center of collision shape is at the middle of the water height
			collision.position = Vector2(water_visual.size.x / 2, -current_height / 2)

func _on_body_entered(body):
	if body.is_in_group("player") and body.has_method("enter_water"):
		body.enter_water()

func _on_body_exited(body):
	if body.is_in_group("player") and body.has_method("exit_water"):
		body.exit_water()

func get_water_surface_y() -> float:
	"""Returns the Y position of the water surface"""
	return global_position.y - current_height
