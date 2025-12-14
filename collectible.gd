extends Area2D

signal collected
signal picked_up(item)

@export var item_name := "Coin"
@export var item_id := "coin"  # Unique identifier for item type
@export var can_pickup := false  # If false, auto-collects on touch. If true, requires key press
@export var pickup_key := "e"  # Key to press to pick up

var player_nearby := false
var player_ref: Node2D = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	if can_pickup and player_nearby and Input.is_action_just_pressed(pickup_key):
		pickup()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_ref = body
		if can_pickup:
			player_nearby = true
			show_pickup_prompt()
		else:
			# Auto-collect items like coins
			collected.emit()
			GameManager.add_coin()
			if player_ref.has_method("add_to_inventory"):
				var item_data = {
					"name": item_name,
					"id": item_id,
					"scene": scene_file_path
				}
				player_ref.add_to_inventory(item_data)
			queue_free()

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		player_ref = null
		hide_pickup_prompt()

func pickup():
	if player_ref and player_ref.has_method("add_to_inventory"):
		var item_data = {
			"name": item_name,
			"id": item_id,
			"scene": scene_file_path
		}
		if player_ref.add_to_inventory(item_data):
			picked_up.emit(item_data)
			queue_free()

func show_pickup_prompt():
	# You can add a label here to show "Press E to pick up"
	pass

func hide_pickup_prompt():
	pass
