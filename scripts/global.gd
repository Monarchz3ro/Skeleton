# global.gd
extends Node

var INVENTORY = []
var currentTimeline

var HISTORY

signal inventory_updated

func _ready():
	INVENTORY.resize(20)

func addItem():
	pass

func removeItem():
	pass
