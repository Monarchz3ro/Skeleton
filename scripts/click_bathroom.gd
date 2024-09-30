extends Node2D

var requiredItems = ["toilet", "counter", "body", "mirror", "showerHead", "showerDrain"]
var doneExamining : bool = false
var nextTimeline = "e1Questions"


func _on_continue_pressed() -> void:
	Dialogic.start("res://timelines/%s.dtl" % nextTimeline)
	self.queue_free()
	Dialogic.VAR.set('clickableScene', "")
