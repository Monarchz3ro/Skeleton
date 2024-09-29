extends Node2D

var requiredItems = ["multiply", "plus", "body", "mirror"]
var doneExamining : bool = false
var nextTimeline = "e1Questions"


func _on_continue_pressed() -> void:
	Dialogic.start("res://timelines/%s.dtl" % nextTimeline)
	self.queue_free()
	Dialogic.VAR.set('clickableScene', "")
