extends Node2D

@export var itemName : String #name of the variable in dialogic
@export var spritePath : String #filename of the image
@export var disappearOnClick: bool #determines whether or not the item is picked up when clicked

func _ready() -> void:
	#$Sprite2D.texture = load("res://clickableObjects/%s" % itemName)
	#Dialogic.VAR.inventoryItems.set(itemName, Global.itemState.INVENTORY)
	$Sprite2D.texture = load(spritePath)
	
	if Dialogic.VAR.inventoryItems.get(itemName) == Global.itemState.GROUND:
		$Sprite2D.visible = true
		$Area2D.visible = true

	if !disappearOnClick:
		$Sprite2D.visible = true


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		$Area2D.visible = false
		if disappearOnClick:
			$Sprite2D.visible = false
		
		Dialogic.VAR.inventoryItems.set(itemName, Global.itemState.INVENTORY)
		Dialogic.start("res://timelines/%s.dtl" % itemName)
		
		var canContinue = true
		for x in $"../..".requiredItems:
			if Dialogic.VAR.inventoryItems.get(x) == Global.itemState.GROUND:
				canContinue = false
				break
		
		if canContinue:
			$"../../continue".visible = true
		print($"../../continue")
		# this is need for when when we want to load when the continue button is visable
		Dialogic.VAR.set("canContinue", true)
