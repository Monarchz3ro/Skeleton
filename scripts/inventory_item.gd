extends Node2D

@export var itemName : String #name of the variable in dialogic
@export var spritePath : String #filename of the image
#@export var timeline: String #filename of the timeline to play when clicked
@export var disappearOnClick: bool #determines whether or not the item is picked up when clicked

func _ready() -> void:
	#$Sprite2D.texture = load("res://clickableObjects/%s" % itemName)
	$Sprite2D.texture = load(spritePath)
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		$Area2D.visible = false
		if disappearOnClick:
			$Sprite2D.visible = false
		Dialogic.start("res://timelines/%s.dtl" % itemName)
		Dialogic.VAR.inventoryItems.set(itemName, Global.itemState.INVENTORY)
		print(Dialogic.VAR.inventoryItems.get(itemName))
