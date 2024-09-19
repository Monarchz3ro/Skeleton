extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.HISTORY = Dialogic.History
	Global.HISTORY.simple_history_enabled = true
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("res://timelines/main.dtl")

# arg: dictionary with commands
# ret: none
# takes a dictionary that will always have a "type" key that says what should happen
func _on_dialogic_signal(arg):
	#pass
	print(arg)
	match arg.type:
		"pause":
			print("pausing")
			Dialogic.paused = true
		"clickableScene":
			print("res://scenes/%s.tscn" % arg.filename)
			var sceneToLoad = load("res://scenes/%s.tscn" % arg.filename)
			$".".add_child(sceneToLoad.instantiate())
		_:
			print_debug(arg)
			print_debug("dialogic signal error")
	pass

func _on_change_to_scene_2_pressed() -> void:
	print(self.name)
