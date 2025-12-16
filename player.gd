extends CharacterBody2D

# Movement constants
const SPEED = 400
const ACCEL = 1500  # Was 1000 - faster acceleration
const DECEL = 2000  # Was 1200 - much faster stopping
const JUMP_FORCE = -700
const GRAVITY = 1800
const MAX_FALL_SPEED = 1600

# Health system
const MAX_HEALTH = 100
const FALL_DAMAGE_THRESHOLD = 1220.0
const FALL_DAMAGE_MULTIPLIER = 0.025
var current_health = MAX_HEALTH
var last_velocity_y = 0.0

# Jumping
var jumps_used = 0
var base_jumps = 1

# Inventory and UI
@onready var inventory = $Inventory
@export var spring_scene: PackedScene
var starting_position := Vector2.ZERO
var warning_label: Label = null
var spring_count_label: Label = null
var jump_count_label: Label = null
var health_label: Label = null

# Underwater mechanics
var is_underwater := false
var time_underwater := 0.0
var drowning := false
var drowning_time_left := 10.0
var last_drowning_int := -1  # Track last printed integer value
const UNDERWATER_TIME_BEFORE_DROWNING = 5.0
const DROWNING_DURATION = 10.0
const DROWNING_DAMAGE_PER_SECOND = 10

# Underwater movement modifiers
const UNDERWATER_SPEED_MULT = 0.6
const UNDERWATER_GRAVITY_MULT = 0.4
const UNDERWATER_JUMP_MULT = 0.8

# UI for drowning
var drowning_label: Label = null

# Rope
var on_rope: Node2D = null
var rope_climb_speed := 300.0
var rope_swing_force := 400.0

func _ready():
	add_to_group("player")
	starting_position = global_position
	
	# Create inventory if needed
	if not has_node("Inventory"):
		var inv = Node.new()
		inv.set_script(preload("res://inventory.gd"))
		inv.name = "Inventory"
		add_child(inv)
		inventory = inv
	
	# Create UI
	create_warning_label()
	create_spring_counter()
	create_jump_counter()
	create_health_display()
	create_drowning_display()
	
	# Connect inventory signals
	if inventory:
		inventory.inventory_changed.connect(update_spring_count)
		inventory.inventory_changed.connect(update_jump_count)
	
	# Initial UI update
	update_spring_count()
	update_jump_count()
	update_health_display()

func _physics_process(delta):
	# Handle underwater time and drowning
	if is_underwater:
		time_underwater += delta
		
		if time_underwater >= UNDERWATER_TIME_BEFORE_DROWNING:
			if not drowning:
				# Start drowning
				drowning = true
				drowning_time_left = DROWNING_DURATION
				last_drowning_int = int(drowning_time_left)
				print("DROWNING STARTED!")
			
			# Count down and take damage
			drowning_time_left -= delta
			
			# Flash countdown - MOVES RANDOMLY EACH SECOND
			if drowning_label:
				drowning_label.visible = true
				drowning_label.text = str(int(drowning_time_left)) + "s"
				
				# Debug print ONLY when integer changes
				var current_int = int(drowning_time_left)
				if current_int != last_drowning_int:
					print("Drowning: ", current_int, "s left")
					last_drowning_int = current_int
					
					# Move to random position near center each second
					var viewport_size = get_viewport().get_visible_rect().size
					var center_x = viewport_size.x / 2
					var center_y = viewport_size.y / 2
					# Random offset: ±100 pixels from center
					var random_offset_x = randf_range(-100, 100)
					var random_offset_y = randf_range(-100, 100)
					drowning_label.position = Vector2(center_x + random_offset_x - 30, center_y + random_offset_y - 100)
				
				# Flash effect
				var flash = int(drowning_time_left * 2) % 2
				drowning_label.modulate = Color(1.0, 0.2, 0.2) if flash == 0 else Color(1.0, 0.5, 0.5)
			
			# Take damage over time
			if drowning_time_left > 0:
				var damage_this_frame = (DROWNING_DAMAGE_PER_SECOND * delta)
				take_damage(int(damage_this_frame))
			else:
				# Out of time - instant death
				current_health = 0
				die()
				return
	
	# Reset jumps when on floor
	if is_on_floor():
		jumps_used = 0
		check_fall_damage()
	
	# Store velocity AFTER physics
	last_velocity_y = velocity.y
	
	# Drop through platforms (press down + jump)
	if Input.is_action_pressed("ui_down") and Input.is_action_just_pressed("ui_accept"):
		position.y += 5
		set_collision_mask_value(1, false)
		await get_tree().create_timer(0.2).timeout
		set_collision_mask_value(1, true)
	
	# Rope physics
	if on_rope:
		handle_rope_movement(delta)
	else:
		# Normal movement
		# Horizontal movement (affected by water)
		var input_x = Input.get_axis("ui_left", "ui_right")
		var current_speed = SPEED
		var current_accel = ACCEL
		var current_decel = DECEL
		
		# Reduce air control when jumping
		if not is_on_floor():
			current_accel *= 0.6  # 60% acceleration in air
			current_decel *= 0.3  # 30% deceleration in air - keep momentum
		
		if is_underwater:
			current_speed *= UNDERWATER_SPEED_MULT
			current_accel *= UNDERWATER_SPEED_MULT
			current_decel *= UNDERWATER_SPEED_MULT
		
		if input_x != 0:
			velocity.x = move_toward(velocity.x, input_x * current_speed, current_accel * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, current_decel * delta)
		
		# Gravity (affected by water)
		var current_gravity = GRAVITY
		if is_underwater:
			current_gravity *= UNDERWATER_GRAVITY_MULT
		
		velocity.y += current_gravity * delta
		if velocity.y > MAX_FALL_SPEED:
			velocity.y = MAX_FALL_SPEED
		
		# Jump with extra jump support
		if Input.is_action_just_pressed("ui_accept"):
			if can_jump():
				do_jump()
		
		# Short hop if jump released early
		if not is_on_floor() and velocity.y < 0 and not Input.is_action_pressed("ui_accept"):
			velocity.y += GRAVITY * delta * 0.5
	
	move_and_slide()

func enter_water():
	"""Called when player enters water"""
	is_underwater = true
	show_warning("Entering water...")

func exit_water():
	"""Called when player exits water"""
	is_underwater = false
	time_underwater = 0.0
	drowning = false
	drowning_time_left = DROWNING_DURATION
	last_drowning_int = -1  # Reset the tracker
	
	if drowning_label:
		drowning_label.visible = false
	
	show_warning("Air!")

func reset_air_timer():
	"""Called when player collects an air bubble"""
	if is_underwater:
		time_underwater = 0.0
		drowning = false
		drowning_time_left = DROWNING_DURATION
		last_drowning_int = int(drowning_time_left)  # Reset to current value
		
		if drowning_label:
			drowning_label.visible = false
		
		show_warning("+AIR!")
		print("Air timer reset by bubble!")

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_R:
			teleport_to_start()
		elif event.keycode >= KEY_1 and event.keycode <= KEY_9:
			var slot_index = event.keycode - KEY_1
			drop_item(slot_index)
	
	if event.is_action_pressed("deploy_spring"):
		deploy_spring()

# ===== HEALTH SYSTEM =====

func check_fall_damage():
	if last_velocity_y > FALL_DAMAGE_THRESHOLD:
		var excess_velocity = last_velocity_y - FALL_DAMAGE_THRESHOLD
		var damage = int(excess_velocity * FALL_DAMAGE_MULTIPLIER)
		print("Taking ", damage, " fall damage!")
		take_damage(damage)

func take_damage(amount: int):
	current_health -= amount
	current_health = max(0, current_health)
	update_health_display()
	
	if amount > 0:
		show_warning("-" + str(amount) + " HP")
	
	if current_health <= 0:
		die()

func heal(amount: int):
	current_health += amount
	current_health = min(MAX_HEALTH, current_health)
	update_health_display()
	show_warning("+" + str(amount) + " HP")

func die():
	show_warning("YOU DIED!")
	await get_tree().create_timer(1.5).timeout
	reset_game()

func reset_game():
	# Reset health
	current_health = MAX_HEALTH
	update_health_display()
	
	# Clear inventory
	if inventory:
		inventory.clear()
	
	# Reset position
	global_position = starting_position
	velocity = Vector2.ZERO
	
	# Tell GameManager to regenerate level
	var chamber = get_tree().get_first_node_in_group("chamber_generator")
	if chamber and chamber.has_method("regenerate_level"):
		chamber.regenerate_level()

# ===== JUMPING =====

func can_jump() -> bool:
	var extra_jumps = 0
	if inventory:
		extra_jumps = inventory.count_item_by_id("extra_jump")
	
	var total_jumps = base_jumps + extra_jumps
	return jumps_used < total_jumps

func do_jump():
	var jump_force = JUMP_FORCE
	if is_underwater:
		jump_force *= UNDERWATER_JUMP_MULT
	
	velocity.y = jump_force
	jumps_used += 1
	
	# Consume an extra jump if we're past the base jump
	if jumps_used > base_jumps and inventory:
		inventory.remove_item_by_id("extra_jump")

# ===== ROPE SYSTEM =====

func handle_rope_movement(delta):
	# Disable normal gravity when on rope
	velocity.y = 0
	
	# Climb up/down
	var climb_input = Input.get_axis("ui_up", "ui_down")
	if climb_input != 0:
		velocity.y = climb_input * rope_climb_speed
	else:
		velocity.y = 0
	
	# Swing left/right
	var swing_input = Input.get_axis("ui_left", "ui_right")
	if swing_input != 0:
		velocity.x += swing_input * rope_swing_force * delta
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
	else:
		velocity.x = lerp(velocity.x, 0.0, 5.0 * delta)
	
	# Jump off rope
	if Input.is_action_just_pressed("ui_accept"):
		release_rope()
		velocity.y = JUMP_FORCE * 0.7

func grab_rope(rope: Node2D):
	on_rope = rope
	velocity = Vector2.ZERO

func release_rope():
	on_rope = null

# ===== UI =====

func create_warning_label():
	warning_label = Label.new()
	warning_label.add_theme_font_size_override("font_size", 24)
	warning_label.modulate = Color(1, 0.3, 0.3)
	warning_label.z_index = 100
	warning_label.visible = false
	add_child(warning_label)

func create_spring_counter():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.name = "SpringCounterUI"
	add_child(canvas_layer)
	
	spring_count_label = Label.new()
	spring_count_label.add_theme_font_size_override("font_size", 32)
	spring_count_label.position = Vector2(20, 20)
	spring_count_label.modulate = Color(0.9, 0.9, 1.0)
	canvas_layer.add_child(spring_count_label)

func create_jump_counter():
	var canvas_layer = get_node_or_null("SpringCounterUI")
	if not canvas_layer:
		canvas_layer = CanvasLayer.new()
		canvas_layer.name = "JumpCounterUI"
		add_child(canvas_layer)
	
	jump_count_label = Label.new()
	jump_count_label.add_theme_font_size_override("font_size", 32)
	jump_count_label.position = Vector2(20, 60)
	jump_count_label.modulate = Color(0.5, 1.0, 0.5)
	canvas_layer.add_child(jump_count_label)

func create_health_display():
	var canvas_layer = get_node_or_null("SpringCounterUI")
	if not canvas_layer:
		canvas_layer = CanvasLayer.new()
		canvas_layer.name = "HealthUI"
		add_child(canvas_layer)
	
	health_label = Label.new()
	health_label.add_theme_font_size_override("font_size", 32)
	health_label.position = Vector2(20, 100)
	health_label.modulate = Color(1.0, 0.3, 0.3)
	canvas_layer.add_child(health_label)

func create_drowning_display():
	var canvas_layer = get_node_or_null("SpringCounterUI")
	if not canvas_layer:
		canvas_layer = CanvasLayer.new()
		canvas_layer.name = "DrowningUI"
		add_child(canvas_layer)
	
	drowning_label = Label.new()
	drowning_label.add_theme_font_size_override("font_size", 48)
	drowning_label.modulate = Color(1.0, 0.2, 0.2)
	drowning_label.visible = false
	drowning_label.z_index = 200
	canvas_layer.add_child(drowning_label)

func update_spring_count():
	if spring_count_label and inventory:
		var count = inventory.count_item_by_id("spring")
		spring_count_label.text = "Springs: " + str(count)

func update_jump_count():
	if jump_count_label and inventory:
		var count = inventory.count_item_by_id("extra_jump")
		jump_count_label.text = "Extra Jumps: " + str(count)

func update_health_display():
	if health_label:
		health_label.text = "HP: " + str(current_health) + "/" + str(MAX_HEALTH)
		# Change color based on health
		if current_health > 60:
			health_label.modulate = Color(0.3, 1.0, 0.3)  # Green
		elif current_health > 30:
			health_label.modulate = Color(1.0, 0.8, 0.0)  # Yellow
		else:
			health_label.modulate = Color(1.0, 0.3, 0.3)  # Red

func show_warning(message: String):
	if warning_label:
		warning_label.text = message
		warning_label.position = Vector2(-100, -80)
		warning_label.visible = true
		await get_tree().create_timer(2.0).timeout
		warning_label.visible = false

# ===== INVENTORY =====

func add_to_inventory(item_data: Dictionary) -> bool:
	if inventory:
		return inventory.add_item(item_data)
	return false

func drop_item(inventory_index: int):
	if not inventory:
		return
	
	var item = inventory.remove_item(inventory_index)
	if item.is_empty():
		return
	
	if item.has("scene") and item.scene:
		var item_scene = load(item.scene)
		if item_scene:
			var dropped_item = item_scene.instantiate()
			get_parent().add_child(dropped_item)
			dropped_item.global_position = global_position + Vector2(0, 50)

func deploy_spring():
	if not inventory:
		return
	
	var spring_index = -1
	for i in range(inventory.get_item_count()):
		var item = inventory.get_item(i)
		if item.get("id") == "spring":
			spring_index = i
			break
	
	if spring_index == -1:
		show_warning("No springs in inventory!")
		return
	
	inventory.remove_item(spring_index)
	
	if spring_scene:
		var spring = spring_scene.instantiate()
		get_parent().add_child(spring)
		
		var facing_direction = -1 if scale.x > 0 else 1
		var offset = Vector2(60 * facing_direction, -30)
		spring.global_position = global_position + offset
		
		# Make spring a physics object if it's a RigidBody2D
		if spring is RigidBody2D:
			spring.linear_velocity = velocity * 0.5
			spring.gravity_scale = 1.0

# ===== UTILITY =====

func teleport_to_start():
	global_position = starting_position
	velocity = Vector2.ZERO

func check_for_loot():
	if inventory and inventory.has_item("loot_bag"):
		inventory.remove_item_by_id("loot_bag")
		show_warning("LOOT DEPOSITED! YOU WIN!")
	else:
		show_warning("Need loot bag from bottom!")
