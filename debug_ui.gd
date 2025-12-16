extends CanvasLayer

# ===== DEBUG_UI.GD =====
# Add this as an Autoload or attach to a CanvasLayer node in your main scene

var teleport_button: Button = null
var player: Node2D = null

func _ready():
	# Create teleport button
	teleport_button = Button.new()
	teleport_button.text = "Teleport to Bottom"
	teleport_button.position = Vector2(10, 200)
	teleport_button.custom_minimum_size = Vector2(150, 40)
	teleport_button.focus_mode = Control.FOCUS_NONE  # <-- ADD THIS LINE
	teleport_button.pressed.connect(_on_teleport_pressed)
	add_child(teleport_button)

func _on_teleport_pressed():
	player = get_tree().get_first_node_in_group("player")
	if not player:
		print("Player not found!")
		return
	
	var chamber = get_tree().get_first_node_in_group("chamber_generator")
	if not chamber:
		print("Chamber not found!")
		return
	
	# Teleport to bottom, near the loot bag
	var floor_node = chamber.get_node_or_null("Floor")
	if floor_node:
		player.global_position = Vector2(chamber.chamber_width / 2, floor_node.global_position.y - 200)
		player.velocity = Vector2.ZERO
		print("Teleported to bottom at: ", player.global_position)
	else:
		print("Floor not found!")
