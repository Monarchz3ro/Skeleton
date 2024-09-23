# global.gd
extends Node

#var INVENTORY = []
#var HISTORY
enum itemState {
	GROUND,
	INVENTORY,
	DONE
}

signal inventory_updated

func _ready():
	#INVENTORY.resize(20)
	pass

func addItem():
	pass

func removeItem():
	pass
