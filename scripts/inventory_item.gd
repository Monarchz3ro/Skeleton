extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		filterHistory(Global.HISTORY.get_simple_history())


# arg: history array
# ret: array that contains each line as a string. Choices are a dict with the options
#			and the choice
func filterHistory(textArray: Array): 
	return textArray.map(func(x): 
		if x.has("all_choices"):
			return {"choices": x["all_choices"],
				"text": x["text"]
			}
		return x["text"]
	)
	
