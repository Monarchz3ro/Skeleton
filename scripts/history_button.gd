extends Node2D

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.is_pressed()):
		print(Global.HISTORY.get_simple_history())


# arg: none
# ret: array that contains each line as a string. Choices are a dict with the options
#			and the choice
func filterHistory(): 
	return Global.HISTORY.get_simple_history().map(func(x): 
		if x.has("all_choices"):
			return {"choices": x["all_choices"],
				"text": x["text"]
			}
		return x["text"]
	)
	
