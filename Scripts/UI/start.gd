extends Control

var create_scene = preload("res://Scenes/create.tscn")
var test_scene = preload("res://Scenes/TestRunner.tscn")
#var guess_scene = preload("res://guess.tscn")

var _levels:Array

func _ready():
	# for each file in levels directory
	# add to menu?	
	_levels = dir_contents('res://Levels')
	
	
func dir_contents(path):
	var files:Array = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(false) # do not include navigational . and .. in results
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				files.append(file_name)
			file_name = dir.get_next()			
	else:
		print("An error occurred when trying to access the path.")
	return files


func _on_Create_pressed():
	get_tree().change_scene_to(create_scene)


func _on_Guess_pressed():
	#get_tree().change_scene_to(guess_scene)
	pass # Replace with function body.


func _on_Test_pressed():
	get_tree().change_scene_to(test_scene)
