extends Node2D

# Spawner settings - UPDATED: spawns every 8 seconds instead of 3
@export var spawn_interval := 8.0  # Was 3.0 - slower spawn rate

var spawn_timer := 0.0
var spawner_visual: ColorRect = null
var bubble_script = preload("res://air_bubble.gd")
var is_underwater := false
var detection_area: Area2D = null

func _ready():
	add_to_group("air_spawner")
	
	# Create visual for spawner (quarter size - 10x10)
	spawner_visual = ColorRect.new()
	spawner_visual.color = Color(0.4, 0.8, 1.0, 0.8)  # Light blue
	spawner_visual.size = Vector2(10, 10)  # Small size
	spawner_visual.position = Vector2(-5, -15)  # Center it above platform
	spawner_visual.visible = false  # Start hidden - only visible underwater
	add_child(spawner_visual)
	
	# Create detection area to sense water
	detection_area = Area2D.new()
	detection_area.collision_layer = 0  # Don't collide with anything
	detection_area.collision_mask = 2   # Detect water on layer 2
	add_child(detection_area)
	
	var detection_shape = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = 10  # Small detection radius
	detection_shape.shape = circle
	detection_area.add_child(detection_shape)
	
	# Connect signals
	detection_area.area_entered.connect(_on_water_entered)
	detection_area.area_exited.connect(_on_water_exited)
	
	print("Air bubble spawner created at: ", global_position)

func _process(delta):
	# Only work when underwater
	if not is_underwater:
		return
	
	spawn_timer += delta
	
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_bubble()
	
	# Pulse animation for spawner
	var pulse = 1.0 + sin(Time.get_ticks_msec() / 200.0) * 0.1
	spawner_visual.scale = Vector2(pulse, pulse)

func _on_water_entered(area):
	if area.is_in_group("water"):
		is_underwater = true
		spawner_visual.visible = true
		print("Spawner entered water - now active")

func _on_water_exited(area):
	if area.is_in_group("water"):
		is_underwater = false
		spawner_visual.visible = false
		print("Spawner left water - now inactive")

func spawn_bubble():
	# Create bubble from script
	var bubble = Area2D.new()
	bubble.set_script(bubble_script)
	get_parent().add_child(bubble)  # Add to parent so it's not a child of spawner
	bubble.global_position = global_position + Vector2(0, -10)  # Spawn slightly above spawner
	
	print("Spawned bubble at: ", bubble.global_position)
