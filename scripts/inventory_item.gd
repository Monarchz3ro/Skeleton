extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		print("clicked")
		print(Global.HISTORY.get_simple_history())
		#var thing = Dialogic.History
		#thing.save_visited_history()
		#print(thing.full_event_history_content)
		
