extends Node

signal inventory_changed
signal item_added(item)
signal item_removed(item)

# Removed max_slots limit - inventory is now unlimited
var items: Array = []

func add_item(item_data: Dictionary) -> bool:
	items.append(item_data)
	item_added.emit(item_data)
	inventory_changed.emit()
	return true

func remove_item(index: int) -> Dictionary:
	if index < 0 or index >= items.size():
		return {}
	
	var item = items[index]
	items.remove_at(index)
	item_removed.emit(item)
	inventory_changed.emit()
	return item

func remove_item_by_id(item_id: String) -> bool:
	for i in range(items.size()):
		if items[i].get("id") == item_id:
			remove_item(i)
			return true
	return false

func get_item(index: int) -> Dictionary:
	if index < 0 or index >= items.size():
		return {}
	return items[index]

func get_item_count() -> int:
	return items.size()

func count_item_by_id(item_id: String) -> int:
	var count = 0
	for item in items:
		if item.get("id") == item_id:
			count += 1
	return count

func has_item(item_id: String) -> bool:
	for item in items:
		if item.get("id") == item_id:
			return true
	return false

func clear():
	items.clear()
	inventory_changed.emit()
