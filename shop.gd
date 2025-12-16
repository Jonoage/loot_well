extends Area2D

# Shop settings - UPDATED PRICES
const SPRING_PRICE = 3
const EXTRA_JUMP_PRICE = 1

# UI elements
var shop_ui: Control = null
var coins_label: Label = null
var spring_button: Button = null
var extra_jump_button: Button = null
var title_label: Label = null

# State
var player_in_shop = false
var player_ref: Node2D = null

# Item scenes
@export var spring_scene: PackedScene
@export var extra_jump_scene: PackedScene

func _ready():
	add_to_group("shop")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Preload scenes if not set
	if not spring_scene:
		spring_scene = load("res://spring_item.tscn")
	if not extra_jump_scene:
		extra_jump_scene = load("res://extra_jump.tscn")
	
	create_shop_ui()
	
	# Connect to coin changes
	if GameManager:
		GameManager.coins_changed.connect(_on_coins_changed)

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_shop = true
		player_ref = body
		show_shop()

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_shop = false
		player_ref = null
		hide_shop()

func create_shop_ui():
	# Create canvas layer for UI
	var canvas = CanvasLayer.new()
	canvas.name = "ShopCanvas"
	add_child(canvas)
	
	# Main container
	shop_ui = Control.new()
	shop_ui.name = "ShopUI"
	canvas.add_child(shop_ui)
	
	# Panel background
	var panel = Panel.new()
	panel.custom_minimum_size = Vector2(300, 200)
	panel.position = Vector2(460, 300)  # Raised higher to prevent cutoff
	shop_ui.add_child(panel)
	
	# VBox for layout
	var vbox = VBoxContainer.new()
	vbox.custom_minimum_size = Vector2(280, 180)
	vbox.position = Vector2(10, 10)
	vbox.add_theme_constant_override("separation", 8)
	panel.add_child(vbox)
	
	# Title
	title_label = Label.new()
	title_label.text = "=== SHOP ==="
	title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title_label.add_theme_font_size_override("font_size", 24)
	title_label.modulate = Color(1.0, 0.84, 0.0)
	vbox.add_child(title_label)
	
	# Coins display
	coins_label = Label.new()
	coins_label.text = "Coins: 0"
	coins_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	coins_label.add_theme_font_size_override("font_size", 20)
	coins_label.modulate = Color(0.9, 0.9, 0.5)
	vbox.add_child(coins_label)
	
	# Separator
	var sep = HSeparator.new()
	vbox.add_child(sep)
	
	# Extra jump button (now cheaper, listed first)
	extra_jump_button = Button.new()
	extra_jump_button.text = "Buy Extra Jump (%d coin)" % EXTRA_JUMP_PRICE
	extra_jump_button.pressed.connect(_on_extra_jump_button_pressed)
	vbox.add_child(extra_jump_button)
	
	# Spring button
	spring_button = Button.new()
	spring_button.text = "Buy Spring (%d coins)" % SPRING_PRICE
	spring_button.pressed.connect(_on_spring_button_pressed)
	vbox.add_child(spring_button)
	
	# Instructions
	var instructions = Label.new()
	instructions.text = "Walk into shop to buy items"
	instructions.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	instructions.add_theme_font_size_override("font_size", 12)
	instructions.modulate = Color(0.7, 0.7, 0.7)
	vbox.add_child(instructions)
	
	shop_ui.visible = false

func show_shop():
	if shop_ui:
		shop_ui.visible = true
		update_shop_ui()

func hide_shop():
	if shop_ui:
		shop_ui.visible = false

func update_shop_ui():
	if not coins_label or not spring_button or not extra_jump_button:
		return
	
	var current_coins = GameManager.get_coins()
	coins_label.text = "Coins: %d" % current_coins
	
	# Enable/disable buttons based on affordability
	spring_button.disabled = current_coins < SPRING_PRICE
	extra_jump_button.disabled = current_coins < EXTRA_JUMP_PRICE

func _on_coins_changed(_new_amount):
	update_shop_ui()

func _on_spring_button_pressed():
	if try_purchase(SPRING_PRICE, "spring"):
		if player_ref and player_ref.has_method("show_warning"):
			player_ref.show_warning("Bought Spring!")

func _on_extra_jump_button_pressed():
	if try_purchase(EXTRA_JUMP_PRICE, "extra_jump"):
		if player_ref and player_ref.has_method("show_warning"):
			player_ref.show_warning("Bought Extra Jump!")

func try_purchase(price: int, item_id: String) -> bool:
	if not GameManager.spend_coins(price):
		if player_ref and player_ref.has_method("show_warning"):
			player_ref.show_warning("Not enough coins!")
		return false
	
	# Give item to player
	give_item_to_player(item_id)
	update_shop_ui()
	return true

func give_item_to_player(item_id: String):
	if not player_ref:
		return
	
	var item_data = {
		"id": item_id,
		"name": "Spring" if item_id == "spring" else "Extra Jump",
		"scene": "res://spring_item.tscn" if item_id == "spring" else "res://extra_jump.tscn"
	}
	
	if player_ref.has_method("add_to_inventory"):
		player_ref.add_to_inventory(item_data)
