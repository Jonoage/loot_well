extends Node2D

var coins_collected = 0

func add_coin():
	coins_collected += 1
	print("Coins: %d" % coins_collected)
