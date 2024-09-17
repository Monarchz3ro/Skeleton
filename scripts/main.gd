extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.HISTORY = Dialogic.History
	Global.HISTORY.simple_history_enabled = true
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("res://timelines/main.dtl")

func _on_dialogic_signal(arg):
	#print(arg)
	var sceneToLoad = load("res://scenes/%s.tscn" % arg)
	$".".add_child(sceneToLoad.instantiate())
	match arg:
		"clickable_scene_1":
			print("clsdfasdf")
		_:
			print_debug("dialogic signal error")
	pass

func _on_change_to_scene_2_pressed() -> void:
	print(self.name)
