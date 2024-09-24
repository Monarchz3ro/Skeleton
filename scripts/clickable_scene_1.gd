extends Node2D

var doneExamining : bool = false
var requiredItems = ["multiply", "divide"]
var nextTimeline = "tl3"

# probobly a better way of doing this instead of checking every frame or copying this script everytime to a clickableScene
func _process(delta: float) -> void:
	if doneExamining:
		return
	
	# check to see if all the items in requiredItems is true
	for x in requiredItems:
		if Dialogic.VAR.inventoryItems.get(x) != Global.itemState.GROUND:
			continue
		return
	
	#if you get all the way here then all the requiredItems should have been clicked
	doneExamining = true
	$continue.visible = true

func _on_continue_pressed() -> void:
	Dialogic.start("res://timelines/%s.dtl" % nextTimeline)
	self.queue_free()
	pass
