extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("main entered")
	Global.HISTORY = Dialogic.History
	Global.HISTORY.simple_history_enabled = true
	Dialogic.start("res://timelines/main.dtl")



func _on_change_to_scene_2_pressed() -> void:
	print(self.name)
