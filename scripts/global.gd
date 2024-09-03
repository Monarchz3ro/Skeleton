# global.gd
extends Node

var inventory = []

signal inventory_updated

func _ready():
	inventory.resize(20)

func addItem():
	pass

func removeItem():
	pass
