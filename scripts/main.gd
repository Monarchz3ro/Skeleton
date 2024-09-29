extends Node2D

@export var sceneToLoad: PackedScene
var instantiatedClickScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#root.move_child(Dialogic, $".".get_index())
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("res://timelines/e1p1.dtl")


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
			sceneToLoad = load("res://scenes/%s.tscn" % arg.filename)
			instantiatedClickScene = sceneToLoad.instantiate()
			$".".add_child(instantiatedClickScene)
			Dialogic.VAR.set('clickableScene', arg.filename)
			
		"background": #changes the background of the timeline
			print("background")
			$TextureRect.texture = load("res://background/%s" % arg.filename)
			
		_: #everything here is an error
			print_debug(arg)
			print_debug("dialogic signal error")
	pass


func _on_save_button_pressed() -> void:
	Dialogic.Save.save("", false, Dialogic.Save.ThumbnailMode.NONE)


func _on_load_button_pressed() -> void:
	if !Dialogic.Save.has_slot("Default"):
		return
	Dialogic.Save.load()
	
	var clickScene = Dialogic.VAR.get('clickableScene')
	
	# gets rid of the clickable scene
	if(instantiatedClickScene):
		instantiatedClickScene.queue_free()
		sceneToLoad = null
	
	# reloads the scene
	#	we do this incase the game is closed and we want to load
	if clickScene != "":
		sceneToLoad = load("res://scenes/%s.tscn" % clickScene)
		instantiatedClickScene = sceneToLoad.instantiate()
		$".".add_child(instantiatedClickScene)
		
		Dialogic.VAR.set('clickableScene', clickScene)
		
		if Dialogic.VAR.get("canContinue"):
			instantiatedClickScene.get_child(0).visible = true
	
	
