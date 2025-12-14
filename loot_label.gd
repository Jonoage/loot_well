extends Label

func _process(delta):
	$".".text = "Coins: %d" % GameManager.coins_collected
