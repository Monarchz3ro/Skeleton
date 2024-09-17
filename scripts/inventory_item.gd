extends Node2D

enum itemState {
	GROUND,
	INVENTORY,
	DONE
}

@export var itemName : String
@export var spritePath : String

func _ready() -> void:
	$Sprite2D.texture = load(spritePath)
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		$Area2D.visible = false
		$Sprite2D.visible = false
		Dialogic.VAR.inventoryItems.set(itemName, itemState.INVENTORY)
		print(Dialogic.VAR.inventoryItems.get(itemName))
