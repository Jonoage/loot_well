extends Node2D

var coins_collected = 0

signal coins_changed(new_amount)

func add_coin():
	coins_collected += 1
	coins_changed.emit(coins_collected)
	print("Coins: %d" % coins_collected)

func get_coins() -> int:
	return coins_collected

func spend_coins(amount: int) -> bool:
	if coins_collected >= amount:
		coins_collected -= amount
		coins_changed.emit(coins_collected)
		print("Spent %d coins. Remaining: %d" % [amount, coins_collected])
		return true
	else:
		print("Not enough coins! Have %d, need %d" % [coins_collected, amount])
		return false

func reset_coins():
	coins_collected = 0
	coins_changed.emit(coins_collected)
