extends Control


var create_scene = preload("res://create.tscn")
#var guess_scene = preload("res://guess.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Create_pressed():
	get_tree().change_scene_to(create_scene)


func _on_Guess_pressed():
	#get_tree().change_scene_to(guess_scene)
	pass # Replace with function body.
