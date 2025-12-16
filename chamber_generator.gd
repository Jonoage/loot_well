# ===== CHAMBER_GENERATOR.GD =====
extends Node2D
@export var shop_scene: PackedScene  # Link to res://shop.tscn in the inspector

var water: Node2D = null
# Chamber dimensions
@export var chamber_width := 1200.0
@export var chamber_depth := 10000.0
@export var wall_thickness := 50.0
@export var top_platform_width := 700.0
@export var outer_wall_height := 500.0

# Colors
@export var well_bg_color := Color(0.1, 0.1, 0.15)
@export var outer_bg_color := Color(0.4, 0.25, 0.15)
@export var sky_color := Color(0.53, 0.81, 0.92)

# Generation settings - UPDATED FOR FEWER PLATFORMS
@export var chunk_height := 1000.0
@export var platform_min_spacing := 120.0  # Was 80.0
@export var platform_max_spacing := 400.0  # Was 300.0
@export var platform_min_width := 200.0
@export var platform_max_width := 800.0

# Scenes
@export var platform_scenes: Array[PackedScene] = []
@export var collectible_scene: PackedScene
@export var spring_item_scene: PackedScene
@export var extra_jump_scene: PackedScene
@export var rope_scene: PackedScene
@export var loot_bag_scene: PackedScene

# Spawn chances
@export var spring_spawn_chance := 0.25
@export var rope_spawn_chance := 0.3  # Was 0.15 - more ropes
@export var extra_jump_spawn_chance := 0.4
@export var air_bubble_spawn_chance := 0.5  # Was 0.3 - even more air bubble spawners (50%!)

# State
var active_chunks := {}
var player: Node2D
var wall_start_y := 0.0
var starting_position := Vector2.ZERO

func _ready():
	add_to_group("chamber_generator")
	player = get_tree().get_first_node_in_group("player")
	if player:
		starting_position = player.global_position
	
	create_chamber_boundaries()
	create_goal_zone()
	# Removed spawn_starting_spring() - no spring at spawn
	call_deferred("spawn_loot_bag")
	call_deferred("spawn_water")
	
	var num_chunks = int(ceil(chamber_depth / chunk_height)) + 2
	for i in range(0, num_chunks):  # Start at 0, not negative
		generate_chunk(i)

func _process(_delta):
	if not player:
		return
	
	var player_chunk = floor(player.global_position.y / chunk_height)
	
	for i in range(max(0, player_chunk - 2), player_chunk + 3):  # Don't go below 0
		if not active_chunks.has(i):
			generate_chunk(i)
	
	var chunks_to_remove = []
	for chunk_id in active_chunks.keys():
		if abs(chunk_id - player_chunk) > 3:
			chunks_to_remove.append(chunk_id)
	
	for chunk_id in chunks_to_remove:
		remove_chunk(chunk_id)
		
func spawn_shop():
	if not shop_scene:
		shop_scene = load("res://shop.tscn")
	
	if not shop_scene:
		print("Shop scene not found!")
		return
	
	var floor_node = get_node_or_null("Floor")
	if not floor_node:
		print("Floor node not found!")
		return
	
	var shop = shop_scene.instantiate()
	add_child(shop)
	# Position shop to the left of the loot bag
	shop.global_position = Vector2(chamber_width / 2 - 250, floor_node.global_position.y - 120)
	print("Shop spawned at: ", shop.global_position)

func start_water_rising():
	"""Called when player picks up the loot bag"""
	if water and water.has_method("start_rising"):
		water.start_rising()

func spawn_water():
	"""Spawn the water at the bottom of the chamber"""
	var water_scene = preload("res://water.gd")
	
	# Create water node
	water = Area2D.new()
	water.set_script(water_scene)
	
	# Position at the bottom of the chamber BEFORE adding to tree
	var floor_node = get_node_or_null("Floor")
	if floor_node:
		water.global_position = Vector2(0, floor_node.global_position.y)
		print("Setting water position to floor Y:", floor_node.global_position.y)
	else:
		water.global_position = Vector2(0, wall_start_y + chamber_depth)
		print("Setting water position to calculated bottom:", wall_start_y + chamber_depth)
	
	# Set water properties BEFORE adding to tree
	water.max_height = chamber_depth
	
	# NOW add it to the tree (this triggers _ready())
	add_child(water)
	
	# Set width after it's in the tree
	water.set_water_width(chamber_width)
	
	print("Water spawned at bottom of chamber")

func _unhandled_input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		teleport_to_start()
		get_viewport().set_input_as_handled()

# ===== LEVEL MANAGEMENT =====

func regenerate_level():
	for chunk_id in active_chunks.keys():
		if active_chunks[chunk_id]:
			active_chunks[chunk_id].queue_free()
	active_chunks.clear()
	
	var num_chunks = int(ceil(chamber_depth / chunk_height)) + 2
	for i in range(0, num_chunks):  # Start at 0, not negative
		generate_chunk(i)
	
	var old_loot = get_node_or_null("LootBag")
	if old_loot:
		old_loot.queue_free()
	call_deferred("spawn_loot_bag")

func teleport_to_start():
	if player:
		player.global_position = starting_position
		player.velocity = Vector2.ZERO

# ===== SPAWNING =====

func spawn_starting_spring():
	if not spring_item_scene:
		return
	
	var spring = spring_item_scene.instantiate()
	add_child(spring)
	if player:
		spring.global_position = player.global_position + Vector2(-100, 0)
	else:
		spring.global_position = Vector2(-100, wall_start_y)

func spawn_loot_bag():
	if not loot_bag_scene:
		return
	
	var floor = get_node_or_null("Floor")
	if not floor:
		return
	
	var loot = loot_bag_scene.instantiate()
	add_child(loot)
	loot.global_position = Vector2(chamber_width / 2, floor.global_position.y - 30)
	call_deferred("spawn_shop")

# ===== GOAL ZONE =====

func create_goal_zone():
	var goal = Area2D.new()
	goal.name = "GoalZone"
	goal.add_to_group("goal")
	add_child(goal)
	
	var goal_visual = ColorRect.new()
	goal_visual.color = Color(1.0, 0.84, 0.0, 0.5)
	goal_visual.size = Vector2(200, 100)
	goal_visual.position = Vector2(-100, -100)
	goal.add_child(goal_visual)
	
	var goal_shape = CollisionShape2D.new()
	var goal_rect = RectangleShape2D.new()
	goal_rect.size = Vector2(200, 100)
	goal_shape.shape = goal_rect
	goal.add_child(goal_shape)
	
	goal.global_position = Vector2(-400, wall_start_y - 50)
	goal.body_entered.connect(_on_goal_entered)
	
	var label = Label.new()
	label.text = "DEPOSIT LOOT HERE"
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.position = Vector2(-100, -130)
	label.add_theme_font_size_override("font_size", 20)
	goal.add_child(label)

func _on_goal_entered(body):
	if body.is_in_group("player") and body.has_method("check_for_loot"):
		body.check_for_loot()

# ===== CHAMBER BOUNDARIES =====

func create_chamber_boundaries():
	# Sky
	var sky_bg = ColorRect.new()
	sky_bg.name = "SkyBackground"
	sky_bg.color = sky_color
	sky_bg.size = Vector2(chamber_width + (top_platform_width + wall_thickness) * 2, outer_wall_height)
	sky_bg.position = Vector2(-top_platform_width - wall_thickness, wall_start_y - outer_wall_height)
	sky_bg.z_index = -101
	add_child(sky_bg)
	
	# Well interior
	var well_bg = ColorRect.new()
	well_bg.name = "WellBackground"
	well_bg.color = well_bg_color
	well_bg.size = Vector2(chamber_width, chamber_depth + wall_thickness)
	well_bg.position = Vector2(0, wall_start_y)
	well_bg.z_index = -100
	add_child(well_bg)
	
	# Outer left background
	var outer_left_bg = ColorRect.new()
	outer_left_bg.name = "OuterLeftBackground"
	outer_left_bg.color = outer_bg_color
	outer_left_bg.size = Vector2(top_platform_width + wall_thickness, chamber_depth + wall_thickness)
	outer_left_bg.position = Vector2(-top_platform_width - wall_thickness, wall_start_y)
	outer_left_bg.z_index = -100
	add_child(outer_left_bg)
	
	# Outer right background
	var outer_right_bg = ColorRect.new()
	outer_right_bg.name = "OuterRightBackground"
	outer_right_bg.color = outer_bg_color
	outer_right_bg.size = Vector2(top_platform_width + wall_thickness, chamber_depth + wall_thickness)
	outer_right_bg.position = Vector2(chamber_width, wall_start_y)
	outer_right_bg.z_index = -100
	add_child(outer_right_bg)
	
	# Bottom background
	var bottom_bg = ColorRect.new()
	bottom_bg.name = "BottomBackground"
	bottom_bg.color = outer_bg_color
	bottom_bg.size = Vector2(chamber_width + (top_platform_width + wall_thickness) * 2, 500)
	bottom_bg.position = Vector2(-top_platform_width - wall_thickness, wall_start_y + chamber_depth + wall_thickness)
	bottom_bg.z_index = -100
	add_child(bottom_bg)
	
	# Top left platform
	create_top_platform(Vector2(-top_platform_width + wall_thickness, wall_start_y), "TopLeftPlatform")
	
	# Top right platform
	create_top_platform(Vector2(chamber_width - wall_thickness, wall_start_y), "TopRightPlatform")
	
	# Outer walls
	create_outer_wall(Vector2(-top_platform_width - wall_thickness, wall_start_y - outer_wall_height), "OuterLeftWall")
	create_outer_wall(Vector2(chamber_width + top_platform_width, wall_start_y - outer_wall_height), "OuterRightWall")
	
	# Inner walls
	create_inner_wall(Vector2(0, wall_start_y + wall_thickness), "LeftWall")
	create_inner_wall(Vector2(chamber_width - wall_thickness, wall_start_y + wall_thickness), "RightWall")
	
	# Floor
	create_floor()

func create_top_platform(pos: Vector2, platform_name: String):
	var platform = StaticBody2D.new()
	platform.name = platform_name
	platform.position = pos
	add_child(platform)
	
	var visual = ColorRect.new()
	visual.color = Color(0.3, 0.3, 0.35)
	visual.size = Vector2(top_platform_width, wall_thickness)
	visual.position = Vector2(0, 0)
	platform.add_child(visual)
	
	var shape = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(top_platform_width, wall_thickness)
	shape.shape = rect
	shape.position = Vector2(top_platform_width / 2, wall_thickness / 2)
	platform.add_child(shape)

func create_outer_wall(pos: Vector2, wall_name: String):
	var wall = StaticBody2D.new()
	wall.name = wall_name
	wall.position = pos
	add_child(wall)
	
	var visual = ColorRect.new()
	visual.color = Color(0.25, 0.25, 0.3)
	visual.size = Vector2(wall_thickness, outer_wall_height + wall_thickness)
	visual.position = Vector2(0, 0)
	wall.add_child(visual)
	
	var shape = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(wall_thickness, outer_wall_height + wall_thickness)
	shape.shape = rect
	shape.position = Vector2(wall_thickness / 2, (outer_wall_height + wall_thickness) / 2)
	wall.add_child(shape)

func create_inner_wall(pos: Vector2, wall_name: String):
	var wall = StaticBody2D.new()
	wall.name = wall_name
	wall.position = pos
	add_child(wall)
	
	var visual = ColorRect.new()
	visual.color = Color(0.2, 0.2, 0.25)
	visual.size = Vector2(wall_thickness, chamber_depth)
	visual.position = Vector2(0, 0)
	wall.add_child(visual)
	
	var shape = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(wall_thickness, chamber_depth)
	shape.shape = rect
	shape.position = Vector2(wall_thickness / 2, chamber_depth / 2)
	wall.add_child(shape)

func create_floor():
	var floor = StaticBody2D.new()
	floor.name = "Floor"
	floor.position = Vector2(0, wall_start_y + chamber_depth)
	add_child(floor)
	
	var visual = ColorRect.new()
	visual.color = Color(0.15, 0.15, 0.2)
	visual.size = Vector2(chamber_width, wall_thickness)
	visual.position = Vector2(0, 0)
	floor.add_child(visual)
	
	var shape = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(chamber_width, wall_thickness)
	shape.shape = rect
	shape.position = Vector2(chamber_width / 2, wall_thickness / 2)
	floor.add_child(shape)

# ===== CHUNK GENERATION =====

func generate_chunk(chunk_id: int):
	var chunk_container = Node2D.new()
	chunk_container.name = "Chunk_" + str(chunk_id)
	add_child(chunk_container)
	
	var chunk_y_start = wall_start_y + (chunk_id * chunk_height)
	var chunk_y_end = wall_start_y + min((chunk_id + 1) * chunk_height, chamber_depth)
	
	if chunk_y_start >= wall_start_y + chamber_depth:
		active_chunks[chunk_id] = chunk_container
		return
	
	var rng = RandomNumberGenerator.new()
	rng.seed = hash(chunk_id)
	
	var current_y = chunk_y_start + rng.randf_range(50, 150)
	
	while current_y < chunk_y_end - 50:
		spawn_platform_with_items(chunk_container, rng, current_y)
		
		# UPDATED SPACING - FEWER PLATFORMS
		var spacing_roll = rng.randf()
		var spacing
		if spacing_roll < 0.3:  # 30% chance - close
			spacing = rng.randf_range(120.0, 200.0)  # Was 80-140
		elif spacing_roll < 0.6:  # 30% chance - medium
			spacing = rng.randf_range(200.0, 280.0)  # Was 140-200
		else:  # 40% chance - far
			spacing = rng.randf_range(280.0, 400.0)  # Was 200-300
		
		current_y += spacing
	
	active_chunks[chunk_id] = chunk_container

func spawn_platform_with_items(container: Node2D, rng: RandomNumberGenerator, y_pos: float):
	if platform_scenes.size() == 0:
		return
	
	var platform_scene = platform_scenes[rng.randi() % platform_scenes.size()]
	var platform = platform_scene.instantiate()
	container.add_child(platform)
	
	# Position platform
	var x_pos = rng.randf_range(100, chamber_width - 100)
	platform.global_position = Vector2(x_pos, y_pos)
	
	# Scale platform width
	var width_scale = rng.randf_range(platform_min_width, platform_max_width) / 100.0
	for child in platform.get_children():
		if child is Sprite2D or child is ColorRect or child is CollisionShape2D:
			child.scale.x = width_scale
	
	# Spawn items on platform - MULTIPLE ITEMS NOW!
	spawn_item_on_platform(platform, rng)

func spawn_item_on_platform(platform: Node, rng: RandomNumberGenerator):
	"""Spawn multiple items on each platform - coins PLUS special items"""
	
	# 30% chance to spawn 1-2 coins per platform (was 50% chance)
	if rng.randf() < 0.3:  # 30% chance - rarer coins
		var num_coins = rng.randi_range(1, 2)  # 1-2 coins
		for i in range(num_coins):
			if collectible_scene:
				var coin = collectible_scene.instantiate()
				platform.add_child(coin)
				# Spread coins across platform
				var coin_x = rng.randf_range(-120.0, 120.0)
				coin.position = Vector2(coin_x, -30)
	
	# Then roll for special items independently (can spawn multiple)
	var spawn_offset_x = rng.randf_range(-150.0, 150.0)
	
	# Air bubble spawner (15% chance)
	if rng.randf() < air_bubble_spawn_chance:
		var spawner_script = preload("res://air_bubble_spawner.gd")
		var spawner = Node2D.new()
		spawner.set_script(spawner_script)
		platform.add_child(spawner)
		spawner.position = Vector2(spawn_offset_x, -30)
		print("Created air bubble spawner on platform")
	
	# Spring (25% chance)
	if rng.randf() < spring_spawn_chance and spring_item_scene:
		var spring = spring_item_scene.instantiate()
		platform.add_child(spring)
		spawn_offset_x = rng.randf_range(-150.0, 150.0)  # New random position
		spring.position = Vector2(spawn_offset_x, -30)
	
	# Rope (15% chance) - keep centered
	if rng.randf() < rope_spawn_chance and rope_scene:
		var rope = rope_scene.instantiate()
		platform.add_child(rope)
		rope.position = Vector2(0, 0)
	
	# Extra jump (40% chance)
	if rng.randf() < extra_jump_spawn_chance and extra_jump_scene:
		var extra_jump = extra_jump_scene.instantiate()
		platform.add_child(extra_jump)
		spawn_offset_x = rng.randf_range(-150.0, 150.0)  # New random position
		extra_jump.position = Vector2(spawn_offset_x, -30)

func remove_chunk(chunk_id: int):
	if active_chunks.has(chunk_id):
		active_chunks[chunk_id].queue_free()
		active_chunks.erase(chunk_id)
