extends Area2D
# ===== LOOT_BAG.GD =====
# Create a loot bag collectible scene with this script
# Scene: Area2D > Sprite2D + CollisionShape2D


signal picked_up

@export var item_name := "Loot Bag"
@export var item_id := "loot_bag"

var player_nearby := false
var player_ref: Node2D = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("e"):
		pickup()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_ref = body
		player_nearby = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		player_ref = null

func pickup():
	if player_ref and player_ref.has_method("add_to_inventory"):
		var item_data = {
			"name": item_name,
			"id": item_id,
			"scene": scene_file_path
		}
		if player_ref.add_to_inventory(item_data):
			picked_up.emit()
			print("Loot bag picked up! Bring it to the goal!")
			queue_free()
