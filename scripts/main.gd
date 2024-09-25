extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#root.move_child(Dialogic, $".".get_index())
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("res://timelines/tl1.dtl")


# arg: dictionary with commands
# ret: none
# takes a dictionary that will always have a "type" key that says what should happen
func _on_dialogic_signal(arg):
	#pass
	print(arg)
	match arg.type:
		"pause": #pause the timeline might not use and delete, it locks mouse
			print("pausing")
			Dialogic.paused = true
			
		"clickableScene": #loads a scene with clickable objects
			print("res://scenes/%s.tscn" % arg.filename)
			var sceneToLoad = load("res://scenes/%s.tscn" % arg.filename)
			$".".add_child(sceneToLoad.instantiate())
			
		"background": #changes the background of the timeline
			print("background")
			$TextureRect.texture = load("res://background/%s" % arg.filename)
			
		_: #everything here is an error
			print_debug(arg)
			print_debug("dialogic signal error")
	pass


func _on_save_button_pressed() -> void:
	print(Dialogic.current_timeline)
	Dialogic.Save.save("", false, Dialogic.Save.ThumbnailMode.NONE)


func _on_load_button_pressed() -> void:
	Dialogic.Save.load()
